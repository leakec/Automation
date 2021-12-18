import atexit
import numpy as np
from time import sleep
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import undetected_chromedriver.v2 as uc
from Pass import passDict
from my_items import myItems

# Get usernames and passwords
todoistUser = passDict["Todoist"]["username"]
todoistPass = passDict["Todoist"]["password"]
ralphsUser = passDict["Ralphs"]["username"]
ralphsPass = passDict["Ralphs"]["password"]

# Constants
sleepTime = 2.0

# Create browser session
browser = uc.Chrome()
atexit.register(browser.close)
tabs = {}

# Useful functions
def newTab(browser):
    browser.execute_script("window.open('');")

def switchTab(browser,key):
    if isinstance(key,str):
        if key in tabs:
            k = tabs[key]
    elif isinstance(key,int):
        k = key
    else:
        raise ValueError(f"key is of type {type(key)}. Only int or str are accepted.")
    browser.switch_to.window(browser.window_handles[k])

# Log into todoist
browser.get("https://todoist.com")
tabs["todoist"] = 0
browser.find_element(By.XPATH,'//*[@id="__next"]/div/main/div[1]/header/nav/div/ul[2]/li[1]/a').click()
browser.find_element(By.XPATH,'//*[@id="email"]').send_keys(todoistUser)
browser.find_element(By.XPATH,'//*[@id="password"]').send_keys(todoistPass)
browser.find_element(By.XPATH,'//*[@id="login_form"]/button').click()
sleep(5.0)

# Get the Alexa shopping list (synced with todoist)
browser.find_element(By.XPATH,'//*[@id="projects_list"]/li[4]/table/tbody/tr/td[2]/span').click()
sleep(sleepTime)

# Get the items from the list
items = browser.find_elements(By.CSS_SELECTOR, ".task_list_item.task_list_item--project_hidden.task_list_item--shortcuts-enabled")
sleep(sleepTime)

# Useful functions
def deleteItem(item):
    item.find_elements(By.CSS_SELECTOR, ".task_checkbox.priority_1")[0].click()

food = [j.text.split("\n")[0] for j in items]

# Go to Ralphs
newTab(browser)
tabs["ralphs"] = 1
switchTab(browser,"ralphs")
sleep(sleepTime)
browser.get("https://www.ralphs.com/signin")
switchTab(browser,0) # Ralphs becomes tab 0 once we get it, not sure why
browser.find_element(By.XPATH,'//*[@id="SignIn-emailInput"]').send_keys(ralphsUser)
browser.find_element(By.XPATH,'//*[@id="SignIn-passwordInput"]').send_keys(ralphsPass)
browser.find_element(By.XPATH,'//*[@id="SignIn-submitButton"]').click() # Not sure why but we need multiple clicks to get past the pop up issue
sleep(sleepTime)

# Add items to shopping cart
addedIdx = np.zeros(len(food),dtype=bool)
for k,item in enumerate(food):
    keywords = myItems.get(item,[])
    if keywords:
        sb = browser.find_element(By.XPATH, '//*[@id="SearchBar-input"]')
        sb.send_keys(item+"\n")
        sleep(sleepTime)

        results = browser.find_elements(By.CSS_SELECTOR, ".AutoGrid-cell.min-w-0")
        for res in results:
            if all((x in res.text for x in keywords)):
                res.find_element(By.CSS_SELECTOR, ".mt-32.mb-12").click()
                addedIdx[k] = True




