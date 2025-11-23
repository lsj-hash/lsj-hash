F_NAME1 = './homework.txt'
F_NAME2 = './message.txt'
F_NAME3 = './data.txt'
F_NAME4 = './data_copy.txt'

# [1] homework, message 읽어서 출력
def print_file(fliename, encode='utf-8'):
    with open(fliename, mode='r', encoding=encode) as f:
        print(f.read())

print_file(F_NAME1)
print_file(F_NAME2, 'ansi')


## ---------------------------------------------------------------------
## [2] data.txt 복사하여 data_copy.txt 생성
## 함수기능 : 원본을 복사해서 복사본 파일 생성
## 함수이름 : copy_file
## 결과반환 : 
## ---------------------------------------------------------------------
def copy_file(originF, copyF, encode='utf-8'):
    ## 원본 파일 열기
    with open(originF, mode='r', encoding=encode) as rf:
        ## 새로운 파일 열기
        with open(copyF, mode='w', encoding=encode) as wf:
            ## 원본 내용 읽어서 새로운 파일에 쓰기
            wf.write(rf.read())

## 함수 호출
copy_file(F_NAME3, F_NAME4)