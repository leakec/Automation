from undetected_chromedriver.v2 import Chrome
from selenium.webdriver.support import expected_conditions as ec
from selenium.webdriver.support.ui import WebDriverWait

class MyDriver(Chrome):
    
    def __init__(self,name=None, **kwargs):
        import atexit

        super().__init__(**kwargs)

        # If an element takes longer than this, exit
        self._timeout = 10

        # Used to keep track of the tabs that are open
        self.tabs = {} 

        name = name or "default"
        self.tabs[name] = self.current_window_handle

        # Register close function
        atexit.register(self.close)

    def newTab(self,name=None):
        self.execute_script("window.open('');")
        name = name or "default"+self._tabIdx
        self.tabs[name] = self.window_handles[-1]
        self.switchTab(name)

    def switchTab(self, key: str):
        if key in self.tabs:
            k = self.tabs[key]
        else:
            raise ValueError(f"key is of type {type(key)}. Only int or str are accepted.")
        self.switch_to.window(k)

    def get_element(self, *args, **kwargs):
        """ Finds an element, but after the element is loaded. """
        try:
            element_present = ec.presence_of_element_located(args)
            return WebDriverWait(self, self._timeout).until(element_present)
        except Exception as e:
            print(e)
            input("Press any key to continute ...")
            return

