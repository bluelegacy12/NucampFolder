class User:
    def __init__(self, name, pin, password):
        self.name = name
        self.pin = pin
        self.password = password

    def change_name(self, new_name):
        self.name = new_name

    def change_pin(self, new_pin):
        self.pin = new_pin

    def change_password(self, new_pass):
        self.password = new_pass

class BankUser(User):
    def __init__(self, name, pin, password):
        super().__init__(name, pin, password)
        self.balance = 0

    def show_balance(self):
        print(f'{self.name} has a balance of: ${self.balance}')

    def withdraw(self, num):
        self.balance -= num

    def deposit(self, num):
        self.balance += num

    def transfer_money(self, user):
        pin = input(f'{self.name}, Please input your pin: ')
        if self.pin == pin:
            if user:
                amount = float(input('How much would you like to send? '))
                print(f'You are transferring ${amount} to {user.name}')
                user.deposit(amount)
                self.withdraw(amount)
                return True
            else:
                print('User does not exist')
                return False
        else:
            print('Incorrect Pin')
            return False

    def request_money(self, user):
        pin = input(f'{self.name}, Please enter your pin: ')
        if pin == self.pin:
            password = input(f"Please enter {user.name}'s password: ")
            if password == user.password:
                amount = float(input('How much would you like to request? '))
                print(f'You are requesting ${amount} from {user.name}')
                user.withdraw(amount)
                self.deposit(amount)
                return True
            else:
                print('Incorrect Password')
                return False
        else:
            print('Incorrect Pin')
            return False
            


''' Driver Code Task 1
user1 = User('Dylan', 1111, 'dpass')
print(f'User: {user1.name}, Pin: {user1.pin}, Password: {user1.password}')'''

'''Driver Code Task 2'''
""" user1 = User('Dylan', 1111, 'dpass')
print(user1.name, user1.pin, user1.password)
user1.change_name('Dyl')
user1.change_pin(1212)
user1.change_password('betterpass')
print(user1.name, user1.pin, user1.password) """

'''Driver Code Task 3'''
""" user1 = BankUser('Dylan', 1111, 'pass')
print(user1.name, user1.pin, user1.password, user1.balance) """

'''Driver Code Task 4'''
""" user = BankUser('Dyl', 1111, 'pass')
user.show_balance()
user.deposit(100)
user.show_balance()
user.withdraw(50)
user.show_balance() """

'''Driver Code Task 5'''
user1 = BankUser('Dylan', '1111', 'dpass')
user2 = BankUser('Alexis', '2222', 'apass')
user2.deposit(5000)
user2.show_balance()
user1.show_balance()
transfer1 = user2.transfer_money(user1)
if transfer1 == True:
    user2.show_balance()
    user1.show_balance()
    transfer2 = user2.request_money(user1)
    if transfer2 == True:
        user2.show_balance()  
        user1.show_balance()
        print('Transactions successful.')
    else:
        print('Transfer failed. Ending transaction.')
else:
    print('Transfer failed. Ending transaction.')