from inspect import isframe
from lib2to3.pgen2 import driver
from selenium import webdriver
from selenium.webdriver.common.by import By

# 打开浏览器
driver = webdriver.Chrome()
driver.get("http://www.santostang.com/2018/07/04/hello-world/")
#切换到iframe
comment_frame = driver.find_elements_by_css_selector("iframe")[0]
driver.switch_to.frame(comment_frame)

#解析评论，输出第一页评论
comments = driver.find_elements_by_css_selector('div.reply-content')
for comment in comments:
    content = comment.find_element_by_tag_name('p')
    print(content.text)
#找到page_current_btn,如果下一页存在则加载下一页，如果下一页不存在则，翻页或者结束
page_btns = driver.find_elements_by_class_name("page-btn")
for page_btn in page_btns:
    print(page_btn.find_element_by_tag_name('span').text)