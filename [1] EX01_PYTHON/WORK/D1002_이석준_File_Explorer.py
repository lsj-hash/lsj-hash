## -----------------------------------------------------
## 파일 탐색기 프로그램
## -----------------------------------------------------

import os
import time

current_path = r"C:\Users\user\Desktop"

## -----------------------------------------------------
## 메뉴 출력 함수
## -----------------------------------------------------


def printMenu():
    print(f'\n{" File Explorer ":=^50}')
    print(f"시작 경로 : {current_path}")
    print("-" * 50)

    items = os.listdir(current_path)
    for i, item in enumerate(items):
        full_path = os.path.join(current_path, item)
        if os.path.isdir(full_path):
            print(f"[{i}] 📁 {item}/")
        else:
            print(f"[{i}] 📄 {item}")
    print("-" * 50)
    print("명령어: 숫자(선택) | 상위 (상위폴더) | x or X(종료)")
    return items

## -----------------------------------------------------
## 파일 정보 출력 함수
## -----------------------------------------------------
def showFileInfo(path):
    size = os.path.getsize(path)
    ctime = time.ctime(os.path.getctime(path))
    print(f"\n[파일 정보]")
    print(f"경로 : {path}")
    print(f"크기 : {size} Bytes")
    print(f"생성일자 : {ctime}")
    print("-" * 50)

## -----------------------------------------------------
## 메인 실행부
## -----------------------------------------------------


while True:
    items = printMenu()
    cmd = input("선택 : ")

    if cmd.lower() == 'x':
        print("프로그램을 종료합니다.")
        break
    elif cmd == '상위':
        current_path = os.path.dirname(current_path)
    elif cmd.isdigit() :
        selecte = items[int(cmd)]
        full_path = os.path.join(current_path, selecte)
        if os.path.isdir(full_path):
            current_path = full_path
        else:
            showFileInfo(full_path)
            input("엔터를 누르면 계속합니다")
    else:
        print("⚠️ 잘못된 입력입니다.")
