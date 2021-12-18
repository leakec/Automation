import atexit
import numpy as np
from time import sleep
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from Pass import passDict
from my_items import myItems

# Get usernames and passwords
todoistUser = passDict["Todoist"]["username"]
todoistPass = passDict["Todoist"]["password"]
ralphsUser = passDict["Ralphs"]["username"]
ralphsPass = passDict["Ralphs"]["password"]

# Constants
chromePath = "/usr/bin/chromedriver"
sleepTime = 2.0

# Set option to avoid access denied error
options = webdriver.ChromeOptions() 
options.add_argument("start-maximized")
options.add_experimental_option("excludeSwitches", ["enable-automation"])
options.add_experimental_option('useAutomationExtension', False)
chrome_prefs = {}
chrome_prefs["profile.default_content_settings"] = { "popups": 1 }
options.experimental_options["prefs"] = chrome_prefs

# Create browser session
s = Service(chromePath)
browser = webdriver.Chrome(service=s, options=options)
browser.delete_all_cookies()
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

"""
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
"""
food = ["chicken"]

# Go to Ralphs
newTab(browser)
tabs["ralphs"] = 1
switchTab(browser,"ralphs")
browser.delete_all_cookies()
sleep(sleepTime)
if False:
    browser.get("https://www.ralphs.com/signin")
    sleep(sleepTime)
    browser.find_element(By.XPATH,'//*[@id="SignIn-emailInput"]').send_keys(ralphsUser)
    browser.find_element(By.XPATH,'//*[@id="SignIn-passwordInput"]').send_keys(ralphsPass)
    for k in range(10):
        try:
            browser.delete_all_cookies()
            browser.find_element(By.XPATH,'//*[@id="SignIn-submitButton"]').click() # Not sure why but we need multiple clicks to get past the pop up issue
            sleep(sleepTime)
        except:
            break
else:
    browser.get("https://www.ralphs.com/")

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




