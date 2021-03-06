import numpy as np
from time import sleep
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from undetected_chromedriver.v2 import ChromeOptions
from Pass import passDict
from my_items import myItems, myRecipes
from my_driver import MyDriver

# Get usernames and passwords
todoistUser = passDict["Todoist"]["username"]
todoistPass = passDict["Todoist"]["password"]
ralphsUser = passDict["Ralphs"]["username"]
ralphsPass = passDict["Ralphs"]["password"]

# Constants
sleepTime = 2.5

# Useful functions
def deleteItem(item):
    item.find_elements(By.CSS_SELECTOR, ".task_checkbox.priority_1")[0].click()

# Create web driver
chrome_options = ChromeOptions()
chrome_options.add_argument("--disable-notifications")
browser = MyDriver(name="todoist", options=chrome_options)

# Log into todoist
browser.get("https://todoist.com")
browser.get_element(By.XPATH,'//*[@id="__next"]/div/div/header/nav[2]/div/ul[2]/li[1]/a').click()
browser.get_element(By.XPATH,'//*[@id="labeled-input-1"]').send_keys(todoistUser)
browser.get_element(By.XPATH,'//*[@id="labeled-input-3"]').send_keys(todoistPass)
browser.get_element(By.XPATH,'//*[@id="todoist_app"]/div/div/div[2]/div[1]/div/div/form/button').click()

# Get the Alexa shopping list (synced with todoist)
browser.get_element(By.XPATH,'//*[@id="projects_list"]/li[4]/div/div/a/span[2]').click()

# Get the items from the list
items = browser.find_elements(By.CSS_SELECTOR, ".task_list_item.task_list_item--project_hidden.task_list_item--shortcuts-enabled")

food = [j.text.split("\n")[0] for j in items]

# Go to Ralphs
browser.newTab(name="ralphs")
browser.get("https://www.ralphs.com/signin")
browser.switchTab("ralphs") # For some reason get puts us back in the first tab
browser.get_element(By.XPATH, '//*[@id="onetrust-accept-btn-handler"]').click() # Accept cookie
browser.get_element(By.XPATH,'//*[@id="SignIn-emailInput"]').send_keys(ralphsUser)
browser.get_element(By.XPATH,'//*[@id="SignIn-passwordInput"]').send_keys(ralphsPass)
sign_in = browser.get_element(By.XPATH,'//*[@id="SignIn-submitButton"]') 
browser.click_safe(sign_in) # Safety click in case ad is present

# Find food element
def addToCart(foodInfo):
    sb = browser.get_element(By.XPATH, '//*[@id="SearchBar-input"]')
    while not sb.get_attribute("value") == "":
        sb.send_keys(Keys.BACK_SPACE)
    sb.send_keys(foodInfo["search"]+"\n")
    sleep(sleepTime)

    keywords = foodInfo["keywords"]
    count = foodInfo.get("count", 1)

    # First result is for items previously bought. Second is for regular item search.
    results = browser.find_elements(By.XPATH, '//*[@id="content"]/div/div/div/div[2]/div[2]/div[3]/div[1]/div')
    results += browser.find_elements(By.CSS_SELECTOR, ".AutoGrid-cell.min-w-0")
    if len(results) < 5:
        sleep(4.0)
        results += browser.find_elements(By.CSS_SELECTOR, ".AutoGrid-cell.min-w-0")
    for res in results:
        if all((x in res.text for x in keywords)):
            if res.find_elements(By.CSS_SELECTOR, ".kds-QuantityStepper-wrapper.kds-QuantityStepper-wrapper--hidden"):
                # Item has not been added to cart yet
                els = res.find_elements(By.CSS_SELECTOR, ".mt-32.mb-12")
                if not els:
                    els = res.find_elements(By.CSS_SELECTOR, ".py-16.align-top.text-center.flex.justify-center.items-center")
                if len(els) > 0:
                    try:
                        els[0].click()
                    except:
                        res.find_element(By.CSS_SELECTOR, ".kds-Button.kds-Button--primary.kds-Button--compact.kds-Button--hasIconOnly.kds-QuantityStepper-incButton.shadow-4").click()
                else:
                    res.find_element(By.CSS_SELECTOR, ".kds-Button.kds-Button--primary.kds-Button--compact.kds-QuantityStepper-ctaButton.shadow-4").click()
                    
                count -= 1
            incrementer = res.find_element(By.CSS_SELECTOR, ".kds-Button.kds-Button--primary.kds-Button--compact.kds-Button--hasIconOnly.kds-QuantityStepper-incButton.shadow-4")
            while count > 0:
                incrementer.click()
                count -= 1
            return True
    return False

# Add items to shopping cart
addedIdx = np.zeros(len(food),dtype=bool)
for k,item in enumerate(food):
    recipeInfo = myRecipes.get(item,{})
    if recipeInfo:
        addedIdx[k] = all(addToCart(myItems[food]) for food in recipeInfo['items'])
    foodInfo = myItems.get(item,{})
    if foodInfo:
        addedIdx[k] = addToCart(foodInfo)

# Get all items that have not been added
notAdded = [food[k] for k,t in enumerate(addedIdx) if not t]

# Remove items that have been completed
browser.switchTab("todoist")
for k,added in enumerate(addedIdx):
    if added:
        deleteItem(items[k])

# Print out items that need to be added manually
print("I was not able to find the following items:")
print(notAdded)
