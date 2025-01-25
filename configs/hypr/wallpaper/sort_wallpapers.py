import sys
import click
import random
from glob import glob
from pathlib import Path
from os import system, environ
from colorthief import ColorThief
from pywal.__main__ import main as pywal_main
from contextlib import contextmanager

# Define variables used througout
options = {}
pic_file = Path("/tmp/swww_pics.txt")

@click.group(
    name="cli",
    invoke_without_command=True,
    chain=True,
    context_settings={"help_option_names": ["-h", "--help"]},
)
@click.option(
    "--randomize-list/--no-randomize-list",
    type=bool,
    help="Generate new randomized list of wallpapers.",
    default=False,
)
@click.option(
    "--change-bg/--no-change-bg",
    type=bool,
    help="Change bg using swww.",
    default=True
)
@click.option(
    "--same-bg/--no-same-bg",
    type=bool,
    help="Keep the same background as before.",
    default=False,
)
@click.option(
    "--file",
    type=click.Path(exists=True, dir_okay=False),
    help="File to change the background to."
)
@click.pass_context
def cli(ctx, **kwargs):
    options.update(kwargs)

dark = cli(standalone_mode=False)
if isinstance(dark, int):
    sys.exit(dark)

def get_color_palette(p: Path, num_colors: int = 4):
    return ColorThief(p).get_palette(color_count=num_colors)

def show_color_palette(colors):
    """
    Shows the colol palette from get_color_palette.
    Useful for debugging
    """
    import numpy as np
    import matplotlib.pyplot as plt

    dark = np.array(colors)
    size = dark.shape[0]
    dark.resize((size, 1, 3))
    plt.imshow(dark)
    plt.show()

def write_rofi_colors(pallete, p: Path = Path(environ.get("HOME") + "/.config/rofi/colors.rasi")):
    orig = """* {
    background:     COLOR;
    background-alt: COLOR;
    foreground:     COLOR;
    selected:       COLOR;
    active:         COLOR;
    urgent:         COLOR;
}
"""
    assert(len(pallete)==6)

    for color in pallete:
        dark = "#{:02x}{:02x}{:02x}".format(*color)
        orig = orig.replace("COLOR",dark,1)
    
    with open(p,"w") as f:
        f.write(orig)

# Create file if it does not exist
if options["randomize_list"] or not pic_file.is_file():
    exts = ["png","jpg","jpeg","gif"]
    pics = []
    home = environ["HOME"]

    for ext in exts:
        pics += glob(home + "/Pictures/Wallpapers/*."+ext)
    random.shuffle(pics)

    with open(pic_file,"w") as f:
        for pic in pics:
            f.write(pic+"\n")
        f.write("0\n") # Counter

if options["change_bg"]:
    if options["same_bg"]:
        with open(pic_file,"r") as f:
            lines = f.readlines()
            counter = int(lines[-1])-1
            pic = lines[counter].strip()
    elif options["file"] is not None:
        pic = options["file"]
        with open(pic_file,"r") as f:
            lines = f.readlines()
        for k,line in enumerate(lines):
            if pic == line.strip():
                lines[-1] = str(k+1)+"\n"
                with open(pic_file, "w") as f:
                    f.write("".join(lines))
                break
    else:
        with open(pic_file,"r") as f:
            lines = f.readlines()
            counter = int(lines[-1])
            pic = lines[counter].strip()
            lines[-1] = str((counter + 1)%(len(lines)-1))+"\n"
        with open(pic_file,"w") as f:
            for line in lines:
                f.write(line)

    if "fit" in pic:
        resize = "--resize fit "
    else:
        resize = ""

    # This transition is really laggy. Try again at a future time when https://github.com/Horus645/swww/issues/154 is fixed.
    #system("swww img "+f" -t wipe --transition-bezier .43,1.19,1,.4 --transition-duration 2 --transition-fps 30 {resize}"+pic)
    system("swww img "+pic+f" --transition-type none {resize}")

    system(f"ln -fs {pic} ~/.config/hypr/wallpaper/current_wallpaper")

    @contextmanager
    def sys_args_ctx():
        save = sys.argv
        try:
            sys.argv = ["wal","-i",pic,"-t","-s","-q"]
            yield
        finally:
            sys.argv = save

    with sys_args_ctx():
        pywal_main()

    system("~/.config/hypr/wallpaper/apply-theme.sh -s")
