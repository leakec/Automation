#!/usr/bin/python

import yaml
import click

@click.command(context_settings=dict(help_option_names=["-h","--help"]))
@click.pass_context
@click.argument("yaml-file", type=str)
@click.argument("output-file", type=str)
def cli(ctx, yaml_file, output_file, **kwargs):
    kwargs['yaml_file'] = yaml_file
    kwargs['output_file'] = output_file
    return kwargs

if __name__ == '__main__':
    cfgobj = cli(standalone_mode=False)

    yamlFile = cfgobj["yaml_file"]
    outputFile = cfgobj["output_file"]

    with open(yamlFile) as f:
        data = yaml.load(f, Loader=yaml.Loader)


