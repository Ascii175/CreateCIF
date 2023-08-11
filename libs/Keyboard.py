from pywinauto import keyboard
from robot.api.deco import keyword
from robot.api import logger
import time
import keyboard

class Keyboard:
    def __init__(self):
        pass
    @keyword("Press Keyboard")
    def Press_keyboard(self, keys):
        ##logger.console(f'press keyboard {keys}')
        ##time.sleep(self.DELAY)
        keyboard.press_and_release(keys)
        #keyboard.hot_key(keys)
        ##time.sleep(self.DELAY)
    def Input_keyboard(self, keys):
        ##logger.console(f'press keyboard {keys}')
        ##time.sleep(self.DELAY)
        keyboard.write(keys)
        #keyboard.hot_key(keys)
        ##time.sleep(self.DELAY)