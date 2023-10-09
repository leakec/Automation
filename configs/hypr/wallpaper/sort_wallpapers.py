import click
import random
from glob import glob
from pathlib import Path
from os import system, environ

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
@click.pass_context
def cli(ctx, **kwargs):
    options.update(kwargs)

run = cli(standalone_mode=False)
if isinstance(run, int):
    import sys

    sys.exit(run)

# Create file if it does not exist
if options["randomize_list"] or not pic_file.is_file():
    exts = ["png","jpg","jpeg"]
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
    with open(pic_file,"r+") as f:
        lines = f.readlines()
        counter = int(lines[-1])
        pic = lines[counter]
        lines[-1] = str((counter + 1)%(len(lines)-1)) + "\n"

        f.seek(0)
    
        for line in lines:
            f.write(line)

    system("swww img "+pic.strip()+" --transition-type outer --transition-pos 0.584,0.977 --transition-step 90")

