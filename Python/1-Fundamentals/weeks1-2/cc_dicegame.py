import random

high_score = 0

def dice_game():
    global high_score
    while True:
        print('Current High Score:', high_score)
        print('1) Roll Dice')
        print('2) Leave Game')
        choice = input('Enter your choice: ')
        print('')
        if choice == '2':
            break
        elif choice != '1':
            print('Invalid option\n')
            continue
        roll1 = random.randint(1, 6)
        roll2 = random.randint(1, 6)
        print('You roll a...', roll1)
        print('And a...', roll2, '\n')
        print('You have rolled a total of:', roll1 + roll2, '\n')
        if high_score < roll1 + roll2:
            high_score = roll1 + roll2
            print('New high score!\n')
    print('Goodbye!')


dice_game()
