# to check if there is a new version of the driver and downloads it automagically
# and returns the latest version driver path (where it is in dir)
from webdriver_manager.chrome import ChromeDriverManager


def get_chromedriver_path():
    driver_path = ChromeDriverManager().install()
    return driver_path