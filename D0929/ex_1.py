def calc(x, y):
    result = {
        "r1" : x+y,
        "r2" : x-y,
        "r3" : x*y
    }

    if y != 0 :
        result.update({
        "r4" : x/y,
        "r5" : x%y,
        "r6" : x//y
    })
    else :
        print("안됩니다.")

    return result

print(calc(13, 5))
