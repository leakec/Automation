# Take files from recipes, convert to recipe_<name>.md in sites. 
# Then run mkdocs build
# Clean should clean out all recipe_*.md in sites.

DOCS = docs
RECIPE_DATA = recipes
RECIPE_TEMPLATE = recipe_template.md
RECIPES_YML = $(wildcard $(RECIPE_DATA)/*.yml)
RECIPES_MD = $(patsubst $(RECIPE_DATA)%, $(DOCS)%, $(patsubst %.yml, %.md, $(RECIPES_YML)))

.PHONY: all clean

clean:
	rm $(DOCS)/*.md

all: $(RECIPES_MD)
	cp $(RECIPE_DATA)/index.md $(DOCS)
	mkdocs build

$(DOCS)/%.md: $(RECIPE_DATA)/%.yml
	python recipe_converter.py --template-file $(RECIPE_TEMPLATE) $< $@ 
