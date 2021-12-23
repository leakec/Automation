import numpy as np
from time import sleep
from selenium.webdriver.common.by import By
from Pass import passDict
from my_items import myItems
from my_driver import MyDriver

# Get usernames and passwords
todoistUser = passDict["Todoist"]["username"]
todoistPass = passDict["Todoist"]["password"]
ralphsUser = passDict["Ralphs"]["username"]
ralphsPass = passDict["Ralphs"]["password"]

# Constants
sleepTime = 2.0

# Useful functions
def deleteItem(item):
    item.find_elements(By.CSS_SELECTOR, ".task_checkbox.priority_1")[0].click()

# Create web driver
browser = MyDriver(name="todoist")

# Log into todoist
browser.get("https://todoist.com")
browser.get_element(By.XPATH,'//*[@id="__next"]/div/main/div[1]/header/nav/div/ul[2]/li[1]/a').click()
browser.get_element(By.XPATH,'//*[@id="email"]').send_keys(todoistUser)
browser.get_element(By.XPATH,'//*[@id="password"]').send_keys(todoistPass)
browser.get_element(By.XPATH,'//*[@id="login_form"]/button').click()

# Get the Alexa shopping list (synced with todoist)
browser.get_element(By.XPATH,'//*[@id="projects_list"]/li[4]/table/tbody/tr/td[2]/span').click()

# Get the items from the list
items = browser.find_elements(By.CSS_SELECTOR, ".task_list_item.task_list_item--project_hidden.task_list_item--shortcuts-enabled")

food = [j.text.split("\n")[0] for j in items]

# Go to Ralphs
browser.newTab(name="ralphs")
browser.get("https://www.ralphs.com/signin")
browser.switchTab("ralphs") # For some reason get puts us back in the first tab
browser.get_element(By.XPATH,'//*[@id="SignIn-emailInput"]').send_keys(ralphsUser)
browser.get_element(By.XPATH,'//*[@id="SignIn-passwordInput"]').send_keys(ralphsPass)
browser.get_element(By.XPATH,'//*[@id="SignIn-submitButton"]').click() 

# Add items to shopping cart
addedIdx = np.zeros(len(food),dtype=bool)
for k,item in enumerate(food):
    keywords = myItems.get(item,[])
    if keywords:
        sb = browser.get_element(By.XPATH, '//*[@id="SearchBar-input"]')
        sb.send_keys(item+"\n")
        sleep(sleepTime)

        results = browser.find_elements(By.CSS_SELECTOR, ".AutoGrid-cell.min-w-0")
        for res in results:
            if all((x in res.text for x in keywords)):
                res.find_element(By.CSS_SELECTOR, ".mt-32.mb-12").click()
                addedIdx[k] = True
