from selenium import webdriver
import unittest
import sys

class ETestCase(unittest.TestCase):
	def setUp(self):	
		self.driver = webdriver.Chrome()

	def test_example(self):
		self.driver.get('http://www.baidu.com')
		self.driver.find_element_by_name(name='wd').send_keys('iquicktest')
		
		self.assertTrue(self.driver.title.find('iquicktest')<0)
	def tearDown(self):
		self.driver.quit()

if __name__ == '__main__':
	unittest.main()