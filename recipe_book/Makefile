# Take files from recipes, convert to recipe_<name>.md in sites. 
# Then run mkdocs build
# Clean should clean out all recipe_*.md in sites.

DOCS = docs
RECIPES = docs/recipes
RECIPE_DATA = recipes
RECIPE_TEMPLATE = recipe_template.md
RECIPES_YML = $(wildcard $(RECIPE_DATA)/*.yml)
RECIPES_MD = $(patsubst $(RECIPE_DATA)%, $(RECIPES)%, $(patsubst %.yml, %.md, $(RECIPES_YML)))

.PHONY: all clean tags

clean:
	rm -rf docs/*

all: tags $(RECIPES_MD)
	cp $(RECIPE_DATA)/index.md $(DOCS)
	cp $(RECIPE_DATA)/*.css $(DOCS)
	mkdocs build

$(RECIPES)/%.md: $(RECIPE_DATA)/%.yml
	mkdir -p $(RECIPES)
	./recipe_converter --template-file $(RECIPE_TEMPLATE) $< $@ 

tags:
	./tags.py $(DOCS) recipes $(RECIPES_YML)
