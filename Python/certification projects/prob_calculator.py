import copy
import random
# Consider using the modules imported above.

class Hat:
  def __init__(self,**kwargs):
    balls=kwargs
    self.contents=[]
    for key,value in balls.items():
      for i in range (value):
        self.contents.append(key)
    print(self.contents)

  def draw(self,num):
    removed=[]
    if num > len(self.contents):
      return self.contents
    else:
      for i in range(num):
        drawed=random.choice(self.contents)
        self.contents.pop(self.contents.index(drawed))
        removed.append(drawed)
    return removed




    
def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
  count=0
  for i in range(num_experiments):
    ex_balls=copy.deepcopy(expected_balls)
    c_hat=copy.deepcopy(hat)
    ball=c_hat.draw(num_balls_drawn)
    for color in ball:
      if color in ex_balls:
        ex_balls[color]-=1
    if all(x<=0 for x in ex_balls.values()):
      count+=1
  return count/num_experiments