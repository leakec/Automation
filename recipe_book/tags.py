#!/usr/bin/python

import yaml
import click

#TODO: Add tag file as an argument
#TODO: Create tag.md file with tags as headings and alphabetical list of recipes underneath

# Setup click
@click.command(context_settings=dict(help_option_names=["-h","--help"]))
@click.pass_context
@click.option("--recipes", nargs=-1, type=str, help="Recipe yaml files.")
def cli(ctx, **kwargs):
    return kwargs

# Get yaml files
try:
    cfgobj = cli(standalone_mode=False)
except:
    # Exit if help was called
    import sys
    sys.exit()

recipes = cfgobj["recipes"]

# Get all tags for all recipes
tags = {}

for recipe in recipes:
    name = recipe.replace(".yml","")
    with open(recipe) as f:
        data = yaml.load(f, Loader=yaml.Loader)

    tagsData = data["tags"]
    for tag in tagsData:
        if tag in tags:
            tags[tag].append(name)
        else:
            tags[tag] = [name]





