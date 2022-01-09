# Recipes
Recipes are stored using YAML files. Here are the valid data fields/sub-fields:

  * title - title of the recipe
  * chef - original chef of the recipe
  * tags - list of tags associated with the recipe
  * ingredients - ingredients in the recipe
    * name - name of the ingredient
    * amount - amount of the ingredient
    * units - unit to use in association with amount
    * notes - any other information about the ingredient
  * time - used to specify the time to make the recipe
    * prep - time needed to prep the recipe
      * hh - hours
      * mm - minutes
    * cook - time needed to cook the recipe
      * hh - hours
      * mm - minutes
    * total - total time needed for recipe. Default is prep+cook unless otherwise specified.
      * hh - hours
      * mm - minutes
  * steps - list of steps used to make the recipe
