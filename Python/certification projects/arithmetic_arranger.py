
def print_equation(opr1,opr2,sym,sol=False):
    
    upper=''
    lower=''
    dash=''
    result=''
    final=''
    for i in range(len(opr1)): 
        max_len= max(len(opr1[i]),len(opr2[i]))
        max_space=max_len+2
        if i<len(opr1)-1:
            upper+=opr1[i].rjust(len(opr1[i])+(max_space-len(opr1[i])))+'    '
            lower+=sym[i]+ opr2[i].rjust(len(opr2[i])+(max_space-len(opr2[i])-1))+'    '
            dash+='-'*max_space+'    ' 
            if sol:
                
                result+=str(calculate(opr1[i],opr2[i],sym[i])).rjust(max_len+2)+'    '
        else:
            upper+=opr1[i].rjust(len(opr1[i])+(max_space-len(opr1[i])))
            lower+=sym[i]+ opr2[i].rjust(len(opr2[i])+(max_space-len(opr2[i])-1))
            dash+='-'*max_space
            if sol:
                
                result+=str(calculate(opr1[i],opr2[i],sym[i])).rjust(max_len+2)
    if sol:
        
        final=upper+'\n'+lower+'\n'+dash+'\n'+result
    else:
        final=upper+'\n'+lower+'\n'+dash
    
    return final

def calculate(opr1,opr2,sym):
    
    if sym=='+':
        result = int(opr1)+int(opr2)
    elif sym=='-':
        result = int(opr1)-int(opr2)
    else:
        pass

    return result


def operations(list):
    symbols=['+','-']
    opr1=[]
    opr2=[]
    sym=[]
    invalid=[]
    for i in range(len(list)):
        for symbol in symbols:
            if symbol in list[i]:
                
                index=list[i].index(symbol)
                opr1.append(list[i][:index].replace(' ',''))
                opr2.append(list[i][index+1:].replace(' ',''))
                sym.append(list[i][index])
                
            else:
                pass
                
    if len(opr1)<len(list):
        return None,None,None
    else:
        return opr1,opr2,sym            


def check_len(opr1,opr2): 

    len1=( False if len(op1)>4 else True for op1 in opr1)
    len2=( False if len(op2)>4 else True for op2 in opr2)

    if  all(len1) and  all(len2):
        return True
    else:
        return False

def digits(opr1,opr2):
    dig1=(op1.isdigit() for op1 in opr1)
    dig2=(op2.isdigit() for op2 in opr2)
    
    if all(dig1) and all(dig2):
        return True
    else:
        return False


list=['3801 - 2', '123 + 49']
    
def arithmetic_arranger(list,sol=False):
    
    opr1,opr2,sym= operations(list)
     
    if len(list)>5:
       return 'Error: Too many problems.'
    
    elif  opr1 == None:
        return "Error: Operator must be '+' or '-'."
    
    elif not check_len(opr1,opr2):
        return "Error: Numbers cannot be more than four digits."

    elif not digits(opr1,opr2):
        return"Error: Numbers must only contain digits."
    
    else:
        final=print_equation(opr1,opr2,sym,sol)
        return final

list=["32 + 8", "1 - 3801", "9999 + 9999", "523 - 49"]
print(arithmetic_arranger(list))

