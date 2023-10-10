# Anony rules
# country (code): CCODE, node: N, 
anonyDict = {} # 원래 이름을 anony 로 바꾸는 테이블
deanonyDict = {} # anony 를 원래 이름으로 바꾸는 테이블 
anonyCountDict = {}

def num_to_military_string(input):



    input_list = []
    index_to_string = ['alpha', 'beta', 'charlie', 'delta', 'echo', 'foxtrot', 'golf', 'hotel', 'india', 'juliet']
    
    if input == 0:
        return index_to_string[0]
    
    while input != 0:
        ind = input%10
        input = input//10
        
        input_list.append(ind)
    
    

    return "_".join([index_to_string[i] for i in input_list])


def anonymize(input, mode=None, string=True):
    import random, string
    
    global anonyDict
    global deanonyDict
    global anonyCountDict
    
    if mode not in anonyCountDict.keys():
        anonyCountDict[mode] = 0
        anonyCount = anonyCountDict[mode]
    else:
        anonyCount = anonyCountDict[mode]


    
    if input in anonyDict.keys():
        return anonyDict[input]

    if mode==None:
        alphabet = random.choice(string.ascii_letters)
        alphabet = alphabet.upper()
    else:
        alphabet = mode.upper()
    
    if string:
        countString = num_to_military_string(anonyCount)
        anonyString = "{}_{}".format(alphabet, countString)

    else:
        anonyString = "{}{}".format(alphabet, anonyCount)
    
    
    anonyDict[input] = anonyString
    deanonyDict[anonyString] = input
    anonyCountDict[mode] = anonyCountDict[mode] + 1

    return anonyString


def deanonymize(anony):
    global deanonyDict
    
    return deanonyDict[anony]

def anonyTable():
    global anonyDict
    return anonyDict
