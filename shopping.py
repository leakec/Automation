import atexit
from time import sleep
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from Pass import passDict

amazonUser = passDict["Amazon"]["username"]
amazonPass = passDict["Amazon"]["password"]
chromePath = "/usr/bin/chromedriver"
sleepTime = 2.0

# Create browser session
s = Service(chromePath)
browser = webdriver.Chrome(service=s)
atexit.register(browser.close)

# Log into amazon
browser.get("https://alexa.amazon.com")
browser.find_element(By.XPATH, '//*[@id="ap_email"]').send_keys(amazonUser)
browser.find_element(By.XPATH, '//*[@id="ap_password"]').send_keys(amazonPass)
browser.find_element(By.XPATH, '//*[@id="signInSubmit"]').click()
sleep(10.0)

# Go to notes
browser.find_element(By.XPATH, '//*[@id="iTodos"]').click()
sleep(sleepTime)
browser.find_element(By.XPATH, '//*[@id="i1632498224946-1ed51217-b161-4432-a6b5-a639e45d2378"]/div').click()
sleep(sleepTime)

# Get the items from the list
items = browser.find_elements(By.CLASS_NAME, "to-do-item")
sleep(sleepTime)

# Useful functions
def checkItem(item):
    item.find_element(By.CLASS_NAME, "mark-done").click()


def deleteItem(item):
    item.click()
    act = item.find_element(By.CLASS_NAME, "actions")
    act.find_element(By.CLASS_NAME, "delete").click()


for item in items:
    print("Item: " + item.text)
