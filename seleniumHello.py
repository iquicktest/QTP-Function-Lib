from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains

wdc = webdriver.Chrome()
wdc.get('http://www.baidu.com')
wdc.find_element_by_name(name='wd').send_keys('iquicktest')