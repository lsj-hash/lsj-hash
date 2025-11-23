#31.4
def is_palindrome(word):
    if len(word) < 2:
        return True
    if word[0] != word[-1]:
        return False
    return is_palindrome(word[1:-1])
print(is_palindrome('hello'))
print(is_palindrome('level'))

#31.5
def fib(n): 
    a, b = 0, 1
    total = 0
    for _ in range(n):
        total += a
        a, b = b, a + b
    return total

n = int(input("숫자 : "))    
print(fib(n))

#33.5
def counter():
    i = 0
    def count():
        nonlocal i
        i+=1
        return i
    return count
c = counter()
for i in range(10) :
    print(c(), end=' ')
print()

#33.6
def countdown(n):   
    i = n
    def count() :
        nonlocal i
        i-=1
        return i+1
    return count
n = int(input("숫자 :  ")) 
c= countdown(n)
for i in range(n):
    print(c(), end=' ')


