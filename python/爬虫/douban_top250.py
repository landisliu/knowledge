import requests
from bs4 import BeautifulSoup

def get_movies():
    headers={
        'user-agent':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36',
        'Host':'movie.douban.com'
    }
    movies=[]
    for index in range(0,10):
        link='https://movie.douban.com/top250?start='+str(index*25)
        resp = requests.get(link,headers=headers)
        soup = BeautifulSoup(resp.text, "lxml")
        div_list = soup.find_all('div',class_='hd')
        for each in div_list:
            movie=each.a.span.text.strip()
            movies.append(movie)
    return movies
movies_list = get_movies()
print(movies_list)
print(len(movies_list))