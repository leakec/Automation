#!/usr/bin/python

import yaml
import click

# Setup click
@click.command(context_settings=dict(help_option_names=["-h","--help"]))
@click.pass_context
@click.argument("yaml-file", type=str, "Input yaml file that has the recipe data).")
@click.argument("output-file", type=str, "Output markdown file that contains the formatted recipe..")
@click.option("--template-file", type=str, help="Recipe template file.", default="recipe_template.md")
def cli(ctx, yaml_file, output_file, **kwargs):
    kwargs['yaml_file'] = yaml_file
    kwargs['output_file'] = output_file
    return kwargs

# Get click config
cfgobj = cli(standalone_mode=False)

# Get input and output files
yamlFile = cfgobj["yaml_file"]
outputFile = cfgobj["output_file"]
templateFile = cfgobj["template_file"]

# Load the data
with open(yamlFile) as f:
    data = yaml.load(f, Loader=yaml.Loader)

# Format the data
title = data['title']
ingredients = ["  * [ ] {} {} {} {} {}\n".format(i.get('amount',''), i.get('units',''), "of" if 'units' in i else "", i['name'], i.get('notes','')).strip() for i in data['ingredients']]
steps = ["  1. {}\n".format(step) for step in data['steps']]

# Apply data to template
with open(templateFile, "r") as f:
    template = f.read()

recipe = template.format(title,ingredients,steps)

# Write recipe
with open(outputFile, "w") as f:
    f.write(recipe)

