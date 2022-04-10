#!/usr/bin/python

import yaml
import click

# Setup click
@click.command(context_settings=dict(help_option_names=["-h","--help"]))
@click.pass_context
@click.argument("output-dir", type=str, nargs=1) # Directory where final tags.md will go
@click.argument("recipe-dir", type=str, nargs=1) # Directory where final .md files are stored
@click.argument("recipes-yml", nargs=-1, type=str) # All of the .yml recipes
def cli(ctx, output_dir, recipe_dir, recipes_yml, **kwargs):
    kwargs['output_dir'] = output_dir 
    kwargs['recipe_dir'] = recipe_dir
    kwargs['recipes_yml'] = recipes_yml
    return kwargs

# Get yaml files
try:
    cfgobj = cli(standalone_mode=False)
except:
    # Exit if help was called
    import sys
    sys.exit()

outputDir = cfgobj["output_dir"]
recipeDir = cfgobj["recipe_dir"]
recipes = cfgobj["recipes_yml"]

# Get all tags for all recipes
tags = {}
nameLink = {}

for recipe in recipes:
    with open(recipe) as f:
        data = yaml.load(f, Loader=yaml.Loader)
    name = data["title"]
    nameLink[name] = recipe.split("/")[-1].replace(".yml",".html")

    tagsData = data.get("tags",{})
    for fullTag in tagsData:
        expand = fullTag.split("/")
        if len(expand) > 1:
            val = tags.setdefault(expand[0],{})
            for tag in expand[1:-1]:
                val = val.setdefault(tag,{})
            val = val.setdefault(expand[-1],[])
        else:
            val = tags.setdefault(expand[0],[])
        val.append(name)

# Write the tags file
def writeTag(tag,vals):
    s = "<details><summary>"+tag+"</summary><ul>\n"
    for v in vals:
        s += '<li><a href="'+recipeDir+"/"+nameLink[v]+'">'+v+"</a></li>\n"
    s += "</ul></details>\n"
    return s

def recurseTag(tag,val,s=""):
    if isinstance(val,list):
        s += writeTag(tag,val)
    else:
        s += "<details><summary>"+tag+"</summary>\n"
        s += '<ul style="list-style-type:none;">\n'
        for t,v in val.items():
            s += "<li>"+recurseTag(t,v)+"</li>"
        s += "</ul></details>\n"
    return s

with open(outputDir+"/tags.md","w") as f:
    for tag,val in tags.items():
        f.write(recurseTag(tag,val))
