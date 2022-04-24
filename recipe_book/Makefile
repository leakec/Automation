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

local: copy_data
	mkdocs build

all: copy_data
	mkdocs serve

website_ngrok: copy_data
	ngrok http 127.0.0.1:8000

website: local
	sudo cp -r site/* /var/www/home/

$(RECIPES)/%.md: $(RECIPE_DATA)/%.yml
	mkdir -p $(RECIPES)
	./scripts/recipe_converter --template-file $(RECIPE_TEMPLATE) $< $@ 

tags:
	./scripts/tags $(DOCS) recipes $(RECIPES_YML)

all_recipes:
	./scripts/all_recipes $(DOCS) recipes $(RECIPES_YML)

copy_data: tags all_recipes $(RECIPES_MD)
	cp $(RECIPE_DATA)/index.md $(DOCS)
	cp $(RECIPE_DATA)/*.css $(DOCS)
