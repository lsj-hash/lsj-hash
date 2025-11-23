# PANDAS WORK
# 제출 : 구글 드라이브에 WORK_1020_이석준.py

import pandas as pd
# 문제 1 아래 데이터를 시리즈 객체로 저장해 주세요. -------- 점수
# 100
# 200
# 300

dataSR = pd.Series([100, 200, 300])
print('-------- 문제 1 ---------')
print(f'인덱스 : {dataSR.index}')
print(f'이름   : {dataSR.name}')
print(f'형  태 : {dataSR.shape}') 
print(f'차  원 : {dataSR.ndim}D')  
print(f'타  입 : {dataSR.dtypes}') 
print(f'메모리 : {dataSR.values}')
print(dataSR)
# -------- 문제 2. 아래 데이터를 시리즈 객체로 저장해 주세요. ---------------------------- 인덱스 점수
# 철수 100
# 영희 200
# 아름 300
print('-------- 문제 2 ---------')
data = [100, 200, 300]
idx = ['철수', '영희', '아름']
dataSR1 = pd.Series(data, idx, name = '점수', dtype='float16')
print(f'인덱스 : {dataSR1.index}')
print(f'이  름 : {dataSR1.name}')
print(f'형  태 : {dataSR1.shape}') 
print(f'차  원 : {dataSR1.ndim}D')  
print(f'타  입 : {dataSR1.dtypes}') 
print(f'메모리 : {dataSR1.values}')
print(dataSR1)
# ---------------------------- 문제 3. 아래 데이터를 시리즈 객체로 저장해 주세요. 저장 후 인덱스 속성과 형태 속성을 출력해 주세요. ---------------------------- 종목명 종가
# 삼성전자 73000
# 셀트리온 356000
# 카카오 367000
# 삼성전자우 68600
# 현대바이오 34150
print('-------- 문제 3 ---------')
num1 = [73000,356000,367000,68600,34150]
idx1 = ['삼성전자', '셀트리온', '카카오', '삼성전자우','현대바이오']
dataSR2 = pd.Series(num1,idx1,name = '종가')
print(f'인덱스 : {dataSR2.index}')
print(f'이  름 : {dataSR2.name}')
print(f'형  태 : {dataSR2.shape}') 
print(f'차  원 : {dataSR2.ndim}D')  
print(f'타  입 : {dataSR2.dtypes}') 
print(f'메모리 : {dataSR2.values}')
print(dataSR2)

# 문제 4. 아래 파일을 읽어서 DataFrame으로 저장하는 함수를 적어주세요.
#               DataFrame = pd.read_파일 확장자(경로포함파일명)
# -> data.xlsx : pd.read_excel('data.xlsx')
# -> data.csv : pd.read_csv('data.csv')
# -> data.json : pd.read_json('data.json')


# 문제 5. 아래 파일을 읽어서 DataFrame으로 저장해 주세요. --------------------------- 이름 나이 직책
# 김은수 35 과장
# 박정민 30 대리
# 이하나 28 대리
data = [['김은수', 35, '과장'],
        ['박정민', 30, '대리'],
        ['이하나', 28, '대리']]
columns=['이름', '나이', '직책']

dataSR = pd.DataFrame(data, columns=columns)
print('-------- 문제 5-1 ---------')
print(f'인덱스 : {dataSR.index}')
print(f'컬럼즈 : {dataSR.columns}')
print(f'형  태 : {dataSR.shape}') 
print(f'차  원 : {dataSR.ndim}D')  
print(f'타  입 : {dataSR.dtypes}') 
print(f'메모리 : {dataSR.values}')
print(dataSR)
## [5-2] Dict 타입의 데이터 저장

data_dict = {'이름' : ['김은수', '박정민', '이하나'],
             '나이' : [35, 30, 28],
             '직책' : ['과장', '대리', '대리']}
dataDF = pd.DataFrame(data_dict)
print('-------- 문제 5-2 ---------')
print(f'인덱스 : {dataDF.index}')
print(f'컬럼즈 : {dataDF.columns}')
print(f'형  태 : {dataDF.shape}') 
print(f'차  원 : {dataDF.ndim}D')  
print(f'타  입 : {dataDF.dtypes}') 
print(f'메모리 : {dataDF.values}')
print(dataDF)



# 문제 6. 아래 데이터를 저장 후 조건을 만족하는 코드를 작성하세요. 
# data = [ ["2차전지(생산)", "SK이노베이션", 10.19, 1.29], 
#          ["해운", "팬오션", 21.23, 0.95], 
#          ["시스템반도체", "티엘아이", 35.97, 1.12], 
#          ["해운", "HMM", 21.52, 3.20], 
#          ["시스템반도체", "아이에이", 37.32, 3.55], 
#          ["2차전지(생산)", "LG화학", 83.06, 3.75] ]
data = [["2차전지(생산)", "SK이노베이션", 10.19, 1.29], 
        ["해운", "팬오션", 21.23, 0.95], 
        ["시스템반도체", "티엘아이", 35.97, 1.12], 
        ["해운", "HMM", 21.52, 3.20], 
        ["시스템반도체", "아이에이", 37.32, 3.55], 
        ["2차전지(생산)", "LG화학", 83.06, 3.75]]
# columns = ["테마", "종목명", "PER", "PBR"]
columns = ["테마", "종목명", "PER", "PBR"]
print('-------- 문제 6 ---------')
# (1-1) DataFrame으로 저장해 주세요.
dataDF = pd.DataFrame(data, columns=columns)
print(dataDF)
# (1-2) 행인덱스를 SK, PO, TL, HMM, IA, LG로 설정해서 저장해 주세요.
dataDF.index = ["SK", "PO", "TL", "HMM", "IA", "LG"]
# dataDF = pd.DataFrame(data, index=index_ columns= columns)

# (1-3) 데이터 전체를 출력하세요.
print(dataDF)

# (1-4) 행 인덱스 속성만 출력하세요.
print(dataDF.index)

# (1-5) 형태 및 차원 정보 출력하세요.
print(dataDF.shape)
print(dataDF.ndim)

# (1-6) 컬럼 속성만 출력하세요.
print(dataDF.columns)

# (1-7) 실제 메모리에 저장된 데이터만 출력해 주세요.
print(dataDF.values)