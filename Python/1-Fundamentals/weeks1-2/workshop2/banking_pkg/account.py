def show_balance(balance):
    print('Current balance: $' + str(balance))

def deposit(balance):
    amount = input('Enter amount to deposit: ')
    return float(amount) + balance

def withdraw(balance):
    while True:
        amount = input('Enter amount to withdraw: ')
        if float(amount) <= balance:
            break
        print("You can't take what you don't have! Enter an amount equal to or lower than your current balance.")
    return balance - float(amount)

def logout(name):
    print('Goodbye ' + name + '!')