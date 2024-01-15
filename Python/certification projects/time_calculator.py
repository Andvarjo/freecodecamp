start="11:40 AM"
end='0:25'



def transform(start):
    if 'AM'  in start:
        symbol='AM'
    else:
        symbol='PM'
    index=start.index(symbol)
    index_start=start.index(':')
    hours=int(start[:index_start].replace(' ',''))
    minutes=int(start[index_start+1:index].replace(' ',''))
    if symbol=='PM':
        hours=hours+12
    return hours,minutes,symbol

def time(time):
    index=time.index(':')
    f_hours=int(time[:index].replace(' ',''))
    f_minutes=int(time[index+1:].replace(' ',''))

    return f_hours,f_minutes

def time_string(s_hours,s_min):
    if s_hours == 0 :
            s_hours = str(12)
            sym='AM'
    elif s_hours >= 12:
        if s_hours==12:
            s_hours=12
        else:
            s_hours =str(s_hours - 12)
        sym='PM'
    else:
        s_hours = str(s_hours)
        sym='AM'
    if s_min<10:
        s_min='0'+str(s_min)
    else:
        str(s_min)

    return s_hours,s_min,sym

def day_string(day,n_days=9):
    day=day.capitalize()
    week=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday']
    index=week.index(day)

    for i in range(n_days+1):
        day=week[index]
        index+=1
        if index>6:
            index=0
    return day



def add_time(start, duration,day=None):

    hours,min,sym=transform(start)
    f_hour,f_min =time(duration)

    s_hours=hours+f_hour
    s_min=min+f_min
    s_hours+=s_min//60
    n_days=s_hours//24
    s_min%=60
    s_hours%=24
    hour,min,sym=time_string(s_hours,s_min)
    print(s_hours)
    if n_days==0:
        s_days=''
    elif n_days==1:
        s_days='(next day)'
    else:
        s_days=f'({n_days} days later)'
    if day != None:
        day=day_string(day,n_days)
        if n_days==0:
            return f"{hour}:{min} {sym}, {day}"
        else:
            return f"{hour}:{min} {sym}, {day} {s_days}"
    else:
        if n_days==0:
            return f"{hour}:{min} {sym}"
        else:
            return f"{hour}:{min} {sym} {s_days}"


print(repr(add_time(start,end)))

