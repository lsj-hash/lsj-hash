## ====================================================================
##         Python GUI Programming - TKinter
## ====================================================================
## LogIn 화면 구성
## - 사용 widget
##   * Label - 타이틀/아이디/비밀번호 3개
##   * Entry - 아이디/비밀번호       2개
##   * Button - 확인/취소           2개
## - 배치 Layout
##   * 표 형식의 Grid
## --------------------------------------------------------------------
## 모듈 로딩
## --------------------------------------------------------------------
import tkinter
import tkinter.font

## --------------------------------------------------------------------
##- 윈도우 관련
## --------------------------------------------------------------------
##- 윈도우 창 인스턴스 생성
window = tkinter.Tk()
window.title("LOGIN")
window.geometry("250x150") # 필요한 만큼 창 크기 조정
window.resizable(False, False)

## --------------------------------------------------------------------
##- 윈도우에 배치될 UI요소(위젯)들 생성
## --------------------------------------------------------------------

# 폰트 설정
title_font = tkinter.font.Font(family="맑은 고딕", size=20, weight="bold")

# 1. 타이틀 레이블
lbl_title = tkinter.Label(window, text="로그인", font=title_font)

# 2. 아이디/비밀번호 레이블
lbl_id = tkinter.Label(window, text="아이디")
lbl_pw = tkinter.Label(window, text="비밀번호")

# 3. 아이디/비밀번호 입력창 (Entry)
ent_id = tkinter.Entry(window, width=20)
ent_pw = tkinter.Entry(window, width=20, show="*") # 비밀번호는 '*'로 표시

# 4. 확인/취소 버튼
btn_ok = tkinter.Button(window, text="확인", width=10)
btn_cancel = tkinter.Button(window, text="취소", width=10)


## --------------------------------------------------------------------
##- 위젯들을 Grid 방식으로 화면에 배치
## --------------------------------------------------------------------

# 0행: 타이틀 (2개의 열을 모두 차지하도록 columnspan=2 설정)
lbl_title.grid(row=0, column=0, columnspan=4)

# 1행: 아이디 레이블과 입력창
lbl_id.grid(row=1, column=0, padx=(20,5))
ent_id.grid(row=1, column=1, columnspan=3, pady=(10,5))

# 2행: 비밀번호 레이블과 입력창
lbl_pw.grid(row=2, column=0)
ent_pw.grid(row=2, column=1, columnspan=3, pady=(5,10))

# 3행: 확인 버튼과 취소 버튼
btn_ok.grid(row=3, column=0, columnspan=2, sticky='nesw')
btn_cancel.grid(row=3, column=2, columnspan=2, sticky='nesw')

## --------------------------------------------------------------------
##- 윈도우에서 발생하는 사용자 이벤트 수신
## --------------------------------------------------------------------
##- 종료 전까지 동작
window.mainloop()