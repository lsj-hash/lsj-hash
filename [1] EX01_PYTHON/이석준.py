import tkinter as tk
import random

# --------------------------------------------------------------------
# 1. 창 설정 및 게임 변수 준비
# --------------------------------------------------------------------
window = tk.Tk()
window.title("카드 뒤집기")
window.geometry("400x460")
window.resizable(False, False)

# 게임에 사용할 카드
cards = ['A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E', 'F', 'F', 'G', 'G', 'H', 'H']
random.shuffle(cards)

# 게임 상태 변수
buttons = []
matches = 0
flip_card = [] # <<-- 수정: 첫번째, 두번째 카드 대신 뒤집힌 카드 목록 하나로 관리

# -------------------------------------------------------------------- 
# 2. 게임 UI 생성
# --------------------------------------------------------------------
grid_frame = tk.Frame(window)
grid_frame.pack(pady=10, padx=10)

for r in range(4):
    row_buttons = []
    for c in range(4):
        btn = tk.Button(grid_frame, text="?", width=5, height=3, font=("", 16, "bold"),
                        command=lambda row=r, col=c: click(row, col))
        btn.grid(row=r, column=c, padx=5, pady=5)
        row_buttons.append(btn)
    buttons.append(row_buttons)

info_label = tk.Label(window, text="같은 카드를 찾으세요!", font = 14)
info_label.pack(pady=5)

# --------------------------------------------------------------------
# 3. 게임 함수 정의
# --------------------------------------------------------------------

## 카드를 눌렀을 때
def click(row, col):
    
    # 이미 2장이 뒤집혔거나, 이미 맞춘 카드는 클릭 방지
    if len(flip_card) >= 2 :
        return

    # 카드 뒤집기
    buttons[row][col].config(text=cards[row * 4 + col])
    flip_card.append({'row': row, 'col': col}) # 뒤집힌 카드 목록에 추가

     # 카드가 2장 뒤집혔으면, 0.5초 후에 매치 확인
    if len(flip_card) == 2:
        window.after(500, check_match)

## 두 카드가 같은지 확인
def check_match():
    global matches

    card1 = flip_card[0]
    card2 = flip_card[1]
    
    r1, c1 = card1['row'], card1['col']
    r2, c2 = card2['row'], card2['col']

    # 같으면
    if cards[r1 * 4 + c1] == cards[r2 * 4 + c2]:
        
        info_label.config(text=f"찾았다!")
        buttons[r1][c1].config(state=tk.DISABLED, bg='lightgreen')
        buttons[r2][c2].config(state=tk.DISABLED, bg='lightgreen')
        
    # 다르면
    else:
        info_label.config(text="땡! 다시 시도하세요.")
        buttons[r1][c1].config(text="?")
        buttons[r2][c2].config(text="?")

    # 다음 턴을 위해 뒤집힌 카드 목록 비우기
    flip_card.clear()

# --------------------------------------------------------------------
# 4. 위젯에 함수 연결 및 게임 시작
# --------------------------------------------------------------------
window.mainloop()
