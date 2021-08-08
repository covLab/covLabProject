import requests
from bs4 import BeautifulSoup

# 이 단어가 포함 된 기사 추출
firms = ["코로나", "백신"]


for firm in firms:
    # 주소를 가져와 soup 객체 만듬
    url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=코로나"
    res = requests.get(url)
    res.raise_for_status()

    soup = BeautifulSoup(res.text, "lxml")
    # 타이틀 날짜
    # 뉴스 타이틀 class명은 news_tite / 날짜 class명은 info
    soup_tit = soup.find_all("a", attrs={"class":"news_tit"})
    soup_info = soup.find_all("span", attrs={"class":"info"})
    print(f"{firm} 기사")
    # zip 함수 이용해서 타이틀과 날짜를 동시에 분리
    for tit, info in zip(soup_tit, soup_info):
        if firm in tit.get_text():
            # 링크는 a["href"] 를 사용하여 가져옴
            print(f"{info.get_text()} {tit.get_text()} {tit['href']}")
    print("")