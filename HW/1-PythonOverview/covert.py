import math

def bmi_cal(weight, height):
    h = height / 100
    weight_pow = math.pow(float(h), 2)
    result = float(weight) / (float(weight_pow))
    return '%.2f' % result
    
def dollar2bath(value1):
    # 1 ดอลลาร์สหรัฐ เท่ากับ 34.76 บาท
    result = float(value1) * 34.76
    return '%.2f' % float(result)

def celsiustofahrenheit(value):
    # 0 เซลเซียส เท่ากับ 32 ฟาเรนไฮต์
    result = value * (9/5) + 32
    return '%.2f' % float(result)

#print(bmi_cal(55, 160))
#print(dollar2bath(5))
#print(celsiustofahrenheit(24))
