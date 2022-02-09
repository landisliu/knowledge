import requests
from bs4 import BeautifulSoup
link = "http://www.santostang.com/"
resp = requests.get(link)
soup = BeautifulSoup(resp.text, "html.parser")
title = soup.find('h1',class_="post-title").a.text.strip()
print(title)
with open('first_title.txt','w') as f:
    f.write(title)