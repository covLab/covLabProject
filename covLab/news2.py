from bs4 import BeautifulSoup as bs
import requests

# 크롤링할 url 주소
url = 'https://search.naver.com/search.naver?where=news&sm=tab_jum&query=코로나'

# requests 패키지의 함수로 url의 html 문서 가져옴
response = requests.get(url)
html_text = response.text

# bs4 패키지의 함수를 이용해 html 문서를 파싱한다.
soup = bs(html_text, 'html.parser')

# 패키지의 select_one 함수와 선택자 개념을 이용해서 뉴스기사 제목 가져옴
# print(soup.select_one('a.news_tit').get_text())

# 패키지의 select 함수와 선택자 개념을 이용해 누스기사 제목을 모두 가져옴
titles = soup.select('a.news_tit')

for i in titles:
     title = i.get_text()
     print(title)




