from banking_pkg import account

def atm_menu(name):
    print("")
    print("          === Automated Teller Machine ===          ")
    print("User: " + name)
    print("------------------------------------------")
    print("| 1.    Balance     | 2.    Deposit      |")
    print("------------------------------------------")
    print("------------------------------------------")
    print("| 3.    Withdraw    | 4.    Logout       |")
    print("------------------------------------------")

headline = "          === Automated Teller Machine ===          "
print(headline)
while True:
    name = input('Enter name to register: ')
    if len(name) <= 10 and len(name) >= 1:
        break
    print('The maximum length is 10 characters, the minimum length is 1 character.')
while True:
    pin = input('Register new PIN: ')
    if len(pin) == 4 and pin.isnumeric():
        break
    print('PIN must be 4 numbers')

balance = 0
print(name + ' has been registered with a starting balance of $' + str(balance))

while True:
    print(headline)
    name_entry = input('Enter name: ')
    pin_entry = input('Enter PIN: ')
    if name_entry == name and pin_entry == pin:
        print('Login successful!')
        break
    print('Invalid credentials!')

while True:
    atm_menu(name)
    option = input('Choose an option: ')
    if option == '1':
        account.show_balance(balance)
    elif option == '2':
        balance = account.deposit(balance)
        account.show_balance(balance)
    elif option == '3':
        balance = account.withdraw(balance)
        account.show_balance(balance)
    elif option == '4':
        account.logout(name)
        break
    else:
        print('Invalid option.')