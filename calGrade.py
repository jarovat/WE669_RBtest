def calGradefunc(score):
    if score>79:
        return "A"
    elif score>69:
        return "B"
    elif score>59:
        return "C"
    elif score>49:
        return "D"
    return "F"

#print(calGradefunc(78))