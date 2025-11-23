# 28.3 연습문제 : 단어 단위 N-gram 만들기
n = int(input('입력'))
text = input('입력')
words = text.split()

if len(words) < n:
    print('wrong')
else:
    n_gram = zip(*[words[i:] for i in range(n)])
    for i in n_gram:
        print(i)

#28.4 심사문제: 파일에서 회문인 단어 출력하기

with open("C:\\Users\\user\\Desktop\\21.txt", mode='r', encoding='UTF-8') as f:
    for line in f:
        word=line.strip() ## 개행문자 제거(+양끝공백도 제거 가능)
        if word==word[::-1]:
            print(word)

#34.5 연습문제: 게임 캐릭터 클래스 만들기
class Knight:

    def __init__(self, health, mana, armor):
        self.health=health
        self.mana=mana
        self.armor=armor
    def slash(self):
        print('베기')

    
x = Knight(health=542.4, mana=210.3, armor=38)
print(x.health, x.mana, x.armor)
x.slash()


#35.1 클래스 속성과 인스턴스 속성 알아보기
class Annie:
    def __init__(self, health, mana, ability_power):
        self.helath = health
        self.mana = mana
        self.ability_power = ability_power

    def tibbers(self):
        tibber = self.ability_power * 0.65 + 400
        print(f'티버: 피해량 {tibber}')

health, mana, ability_power = map(float, input('체력 마나 AP 입력 : ').split())

x = Annie(health=health, mana=mana, ability_power=ability_power)
x.tibbers()