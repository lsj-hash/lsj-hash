import tkinter

# 1. 윈도우 생성 및 기본 설정
window = tkinter.Tk()
window.title("계산기")
window.geometry("300x400")
window.resizable(False, False)

##- 전역 변수
ROWS    = 4
COLS    = 4


# 2. 버튼 클릭 시 실행될 함수 정의
def on_button_click(value):
    if value == 'C':
        display.delete(0, 'end')
    elif value == '=':
        result = eval(display.get())
        display.delete(0, 'end')
        display.insert(0, str(result))
    else:
        display.insert('end', value)

# 3. 화면 구성 (위젯 생성 및 배치)

# 결과 표시창
display = tkinter.Entry(window, justify="right", relief="solid", bd=2)
display.grid(row=0, column=0, columnspan=4, sticky="nsew", padx=5, pady=5)

# 버튼 텍스트 리스트
button_texts = [
    ['7', '8', '9', '/'],
    ['4', '5', '6', '*'],
    ['1', '2', '3', '-'],
    ['C', '0', '=', '+']
]

# 반복문으로 버튼 생성 및 배치
for r in range(ROWS):
    for c in range(COLS):
        button = button_texts[r][c]
        btn = tkinter.Button(window ,relief="solid", text=button, command=lambda val=button: on_button_click(val))
        # Button 인스턴스 배치
        btn.grid(row=r + 1, column=c, sticky="nsew", padx=2, pady=2)

# 4. 그리드 행/열 비율 설정
window.grid_rowconfigure(0, weight=1) # 표시창 행
for i in range(4):
    window.grid_rowconfigure(i + 1, weight=2) # 버튼 행
    window.grid_columnconfigure(i, weight=1)  # 모든 열

# 5. 윈도우 실행
window.mainloop()