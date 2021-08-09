#!/usr/bin/env python
# coding: utf-8

# In[4]:


from bs4 import BeautifulSoup as bs
import requests
import cx_Oracle
import os
from datetime import datetime, timedelta
import time

#현재시각
now= datetime.now()

# 이 단어가 포함 된 기사 추출
firms = ["코로나", "백신"]


            

#뉴스 작성시간 생긴 게 매우 마음에 들지 않으므로,,, 
#8시간 전 ==> 2021년 8월 8일 20시
#print(time.strftime('%D %H시'))
LOCATION=r"C:\instantclient_19_8"
os.environ["PATH"] = LOCATION + ";" + os.environ["PATH"] #환경변수 등록

connect = cx_Oracle.connect("c##semi", "c##semi", "localhost:1521/xe")
cursor = connect.cursor()

#####테이블 삭제 명령어(처음 실행시 주석처리 필수, 이후 실행 시 주석 해제 필수!)
cursor.execute("DROP TABLE NEWSDATA")

#테이블 생성 명령어
cursor.execute("CREATE TABLE NEWSDATA(TITLE VARCHAR(100) NOT NULL, URL VARCHAR(200) NOT NULL)")
cursor.execute("COMMENT ON TABLE NEWSDATA IS '뉴스'")
#cursor.execute("COMMENT ON COLUMN NEWSDATA.WRTN_TM IS '송고시간'")
cursor.execute("COMMENT ON COLUMN NEWSDATA.TITLE IS '기사제목'")
cursor.execute("COMMENT ON COLUMN NEWSDATA.TITLE IS '기사링크'")
for firm in firms:
    # 주소를 가져와 soup 객체 만듬
    url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=코로나"
    res = requests.get(url)
    res.raise_for_status()

    soup = bs(res.text, "lxml")
    # 타이틀 날짜
    # 뉴스 타이틀 class명은 news_tite / 날짜 class명은 info
    soup_tit = soup.find_all("a", attrs={"class":"news_tit"})
    soup_info = soup.find_all("span", attrs={"class":"info"})
    # zip 함수 이용해서 타이틀과 날짜를 동시에 분리
    for tit, info in zip(soup_tit, soup_info):
        if firm in tit.get_text():
            # 링크는 a["href"] 를 사용하여 가져옴
            #print(f"뉴스 작성시간:{info.get_text()}")
            #hr_b4=int(info.get_text().strip("시간 전"))
            #wrtn_tm=(now-timedelta(hours=hr_b4)).strftime('%D %H:00')
            # 기사 제목이 따옴표 때문에 계속 오류나서 추가한 코드
            title=tit.get_text()
            title=title.replace('"','\"')
            title=title.replace("'","\"")
            
            query="INSERT INTO NEWSDATA VALUES (\'"+title+"\',\'"+tit['href']+"\')"
            cursor.execute(query)
connect.commit()



# In[ ]:




