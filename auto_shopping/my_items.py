myItems = {
        "chicken": {"search": "chicken", "keywords": ["Natural Raised Cage Free", "Breast"]},
        "ground turkey": {"search": "ground turkey", "keywords": ["Jennie-O", "93% Lean", "Ground Turkey"]},
        "carl's milk": {"search": "whole milk", "keywords": ["Ralphs", "Whole", "1 gal"]},
        "nina's milk": {"search": "milk 0% organic", "keywords": ["Fat Free", "0.5 gal"]},
        "tortilla": {"search": "tortilla", "keywords": ["Whole Wheat", "Flour Tortillas", "24 ct"]},
        "eggs": {"search": "eggs", "keywords": ["Happy Egg","Free Range","18 ct"]},
        "bread": {"search": "bread", "keywords": ["Dave's Killer", "Whole Grain"]},
        "green pepper": {"search": "green pepper", "keywords": ["Green Bell Pepper", "1 ct"]},
        "red pepper": {"search": "red pepper", "keywords": ["Red Bell Pepper", "1 ct"]},
        "yellow pepper": {"search": "yellow pepper", "keywords": ["Yellow Bell Pepper", "1 ct"]},
        "orange pepper": {"search": "orange pepper", "keywords": ["Orange Bell Pepper", "1 ct"]},
        "onion": {"search": "onion", "keywords": ["Medium", "Yellow", "Onions"]},
        "nina's burritos": {"search": "amys burrito", "keywords": ["Amy's","Bean","Cheddar","6 oz"]},
        "climbing burritos": {"search": "burrito", "keywords": ["El Monterey","Bean","Beef","8 ct"]},
        "butter": {"search": "butter", "keywords": ["Kerrygold","Irish","Butter"]},
        "carl's vitamins": {"search": "vitamins", "keywords": ["One A Day Men's","Pro Edge"]},
        "salsa": {"search": "salsa", "keywords": ["Tostitos", "Medium", "Chunky", "Salsa"]},
        "chipotle salsa": {"search": "chiptole salsa", "keywords": ["Private Selection", "Medium", "Tomatillo", "Chipotle"]},
        "fajita seasoning": {"search": "fajita seasoning lawry", "keywords": ["Lawry", "Fajitas", "Seasoning"]},
        "taco seasoning": {"search": "taco seasoning", "keywords": ["Old El Paso", "Reduced Sodium", "Taco Seasoning"]},
        "supreme pizza": {"search": "supreme pizza", "keywords": ["Red Baron", "Classic Crust", "Supreme"]},
        "oranges": {"search": "oranges", "keywords": ["Kroger", "Naval Oranges", "4lb"]},
        "frozen chicken": {"search": "frozen chicken", "keywords": ["Tyson", "Grilled", "Fully Cooked"]},
        "crushed tomatoes": {"search": "crushed tomatoes", "keywords": ["Hunt's", "Crushed Tomatoes", "28 oz"]},
        "banana": {"search": "banana", "keywords": ["Organic", "Banana"]},
        "parmesean cheese": {"search": "parmesean cheese", "keywords": ["Kroger","Shredded","Parmesean", "6 oz"]},
        "romano cheese": {"search": "romano cheese", "keywords": ["Private Selection","Shredded","Romano", "5 oz"]},
        "bacon": {"search": "bacon", "keywords": ["Kroger", "Thick Cut", "Hardwood Smoked", "16 oz"]},
        "bucatini": {"search": "bucatini", "keywords": ["Private Selection", "Bucatini", "16 oz"]},
        "tortilla chips": {"search": "tortilla chips", "keywords": ["Tostitos", "Scoops", "Chips", "10 oz"]},
        "frozen vegetables": {"search": "frozen vegetables", "keywords": ["Birds Eye", "California Blend", "60 oz"]},
        "avocado": {"search": "avocado", "keywords": ["Kroger","Hass Avocado", "4 ct"]},
        "guacamole salsa": {"search": "guacamole salsa", "keywords": ["Herdez", "Medium", "Guacamole", "Salsa", "15.7 oz"]},
        "chipotle sauce": {"search": "chipotle sauce", "keywords": ["Cholula", "Chipotle", "Hot Sauce"]},
        "half and half": {"search": "half and half", "keywords": ["Kroger", "Half", "1 pt"]},
        "chicken broth": {"search": "chicken broth", "keywords": ["Simple Truth", "Low Sodium", "Free Range", "Chicken Broth", "32 oz"]},
        "frozen peas": {"search": "frozen peas", "keywords": ["Birds Eye", "Sweet Peas", "10 oz"]},
        "sour cream": {"search": "sour cream", "keywords": ["Daisy Pure", "Sour Cream", "8 oz"]},
        "cheddar cheese": {"search": "cheddar cheese", "keywords": ["Kroger", "Sharp Cheddar Cheese", "32 oz"]},
        "sugar": {"search": "sugar", "keywords": ["C&H", "Pure Granulated", "4 lb"]},
        "everything bagels": {"search": "everything bagels", "keywords": ["Thomas", "Everything Bagels"]},
        "black beans": {"search": "black beans", "keywords": ["Kroger", "Black Beans"]},
        "diced tomatoes": {"search": "diced tomatoes", "keywords": ["Rotel", "Green Chilies", "Diced Tomatoes"]},
        "bratwurst": {"search": "bratwurst", "count": 2, "keywords": ["Kroger", "Bratwurst"]},
        "bratwurst buns": {"search": "whole wheat hot dog buns", "keywords": ["Simple Truth", "Whole Wheat", "Hot Dog Buns"]},
        "bratwurst beer": {"search": "beer 24 oz", "count": 2, "keywords": ["Corona", "Lager Beer", "24 fl oz"]},
        "ham lunchmeat": {"search": "black forest ham", "keywords": ["Applegate", "Uncured", "Black Forest Ham"]},
        "peanut butter": {"search": "peanut butter", "keywords": ["All Natural", "Peanut Butter"]},
        "tater tots": {"search": "tater tots", "keywords": ["Tater Tots", "Frozen"]},
        "coffee": {"search": "coffee whole peets", "keywords": ["Peet's", "Whole Bean", "Big Bang Medium"]},
        "floss": {"search": "floss", "keywords": ["Kroger", "Floss", "Mint Wax"]},
}

myItems["tortillas"] = myItems["tortilla"]
myItems["bananas"] = myItems["banana"]
myItems["pizza"] = myItems["supreme pizza"]
myItems["avocados"] = myItems["avocado"]
myItems["climing burritos"] = myItems["climbing burritos"]
myItems["bagels"] = myItems["everything bagels"]

#################################
myRecipes = {
    "amatriciana": {"items": ["crushed tomatoes","buccatini","romano cheese","parmesean cheese", "bacon"]},
    "fajitas": {"items": ["chicken","red pepper", "yellow pepper", "green pepper", "orange pepper", "onion", "tortillas", "fajita seasoning", "avocado"]},
    "chicken tortilla soup": {"items": ["chicken","red pepper", "yellow pepper", "green pepper", "chicken broth", "half and half", "frozen peas", "sour cream", "salsa", "chipotle salsa"]},
    "tacos": {"items": ["ground turkey", "black beans", "diced tomatoes", "onion", "tortillas", "taco seasoning", "avocado"]},
    "beer bratwurst": {"items": ["bratwurst", "bratwurst buns", "bratwurst beer", "onion"]},
}
