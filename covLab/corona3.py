# -*- coding: utf-8 -*-
from urllib.request import urlopen
from urllib.parse import urlencode, unquote, quote_plus
import urllib
import requests
import json
import pandas as pd
from datetime import datetime, timedelta
import xmltodict
# xmltodict 는 결과가 xml 형식으로 반환된다. 이것을 dict로 바꿔주는 라이브러리다.

# 어제 날짜와 오늘 날짜를 구하기 위해서 datetime 과 timedelta를 사용
# 어제 날짜와 오늘날짜를 구하기 위해서  datetime과 timedelta를 사용
yester = datetime.today() - timedelta(1)
yseter = yester.strftime("%Y%m%d")
now_today = datetime.today().strftime("%Y%m%d")

my_api_key = 'r1Vo15jNc%2FmPCYL5G4sStGglWcHAH2nR%2BW1Zf5E1zQlriYMkWx5qQn%2FFIQIhaJeJ3uho55OQ%2F3hi4YDYb5ooYg%3D%3D'

# 서비스 url 주소
url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson'
# http://openapi.data.go.kr/openapi/service/rest/Covid19

# 서비스에 필요한 파라미터 모음
queryParams = '?' + \
'ServiceKey=' + '{}'.format(my_api_key) + \
'&pageNo='+ '1' + \
'&numOfRows='+ '999' + \
'&startCreateDt={}&endCreateDt={}'.format(yseter,now_today)

#서비스url에 필요한 파라미터들을 붙여서 응답결과를 얻음.
result = requests.get(url + queryParams)

# 응답결과 파싱하기. ( 사용자가 원하는 형태로 변경)
# 응답 key 값이 영문화 되어 식별이 어려워 openAPI 문서를 참고하여
# replayce 를 통해 결과를 한글화 했다.

result = result.content
jsonString = json.dumps(xmltodict.parse(result), indent = 4)
jsonString = jsonString.replace('resultCode', '결과코드').replace('resultMsg', '결과메세지').replace('numOfRows', '한 페이지 결과 수').replace('pageNo', '페이지 수').replace('totalCount', '전체 결과 수').replace('seq', '게시글번호(감염현황 고유값)').replace('stateDt', '기준일').replace('stateTime', '기준시간').replace('decideCnt', '확진자 수').replace('clearCnt', '격리해제 수').replace('examCnt', '검사진행 수').replace('deathCnt', '사망자 수').replace('careCnt', '치료중 환자 수').replace('resutlNegCnt', '결과 음성 수').replace('accExamCnt', '누적 검사 수').replace('accExamCompCnt', '누적 검사 완료 수').replace('accDefRate', '누적 환진률').replace('createDt', '등록일시분초').replace('updateDt', '수정일시분초')

js = json.loads(jsonString)
# 파싱한 전체 결과 보기.
print(js)
js_check_count = js["response"]['body']['items']['item'][0]['검사진행 수']
js = js["response"]['body']['items']['item']
pdata = pd.DataFrame(js)

# 원하는 정보만 파싱한 결과
# 누적 검사자 수와 누적 확진자수를 제공하기 때문에
# 전일과의 차이로 일일 확진자, 검사자 수를 구했다.

print('전일 검사 확진자수 : ', int(pdata.loc[0][7]) - int(pdata.loc[1][7]))
print('전일 코로나 검사 수', int(pdata.loc[0][8]))

