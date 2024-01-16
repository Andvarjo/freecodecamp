
class Category:
  def __init__(self, name):
      self.name = name
      self.ledger = []

  def __str__(self):

    length=30
    name = f"{'*' * ((length-len(self.name)) // 2)}{self.name}{'*' * ((length-len(self.name)) // 2)}\n"
    out=name
    items=''
    total=0
    for element in self.ledger:
      description = element['description'][0:23]
      amount = format(element['amount'], '.2f')
      out += f"{description:<23}{amount:>7}\n"
      total+=element['amount']
    out += f"Total: {total:.2f}"

    return out


  def deposit(self, amount,description=''):

      self.ledger.append({'amount':amount,'description':description})

  def withdraw(self,amount,description=''):

      if self.check_funds(amount):
          self.ledger.append({'amount':-amount,'description':description})
          return True
      else:
          return False

  def get_balance(self):
      balance=0
      for elements in self.ledger:
          balance+=elements['amount']
      return balance

  def transfer(self,amount,category):

      if self.check_funds(amount):
          self.withdraw(amount,'Transfer to '+ category.name)
          category.deposit(amount,'Transfer from '+self.name )
          return True
      else:
          return False

  def check_funds(self,amount):
    if self.get_balance()>= amount:
      return True
    else:
      return False

  def get_totals(self):
    total=0
    for element in self.ledger:
      if element['amount']<0:	
        total+=element['amount']
    return total


def get_percent(categories):
  total=0
  percents=[]
  for item in categories:
    total+=item.get_totals()
    percents.append(item.get_totals()//total)
  return percents


def create_spend_chart(categories):
  categories_names = []
  spent = []
  spent_percentages = []
  for category in categories:
      categories_names.append(category.name)
      spent.append(-category.get_totals())
  spent_total = sum(spent)
  for amount in spent:
      spent_percentages.append(int(amount * 100 / spent_total))
  
  graph = "Percentage spent by category\n"
  for i in range(100, -1, -10):
      graph += str(i).rjust(3) + "| "
      for percentage in spent_percentages:
          if percentage >= i:
              graph += "o  "
          else:
              graph += "   "
      graph += "\n"
  graph += "    " + "-" + "---" * len(categories_names) + "\n"
  longest_name_length = max([len(name) for name in categories_names])
  for i in range(longest_name_length):
      name_string = '     '
      for name in categories_names:
          if i < len(name):
              name_string += name[i] + '  '
          else:
              name_string += '   '
      if i < longest_name_length - 1:
          graph += name_string + "\n"
      else:
          graph += name_string
  return graph
