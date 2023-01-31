import random

def guess_random_number(tries, start, stop):
    target = random.randrange(start, stop)
    while tries != 0:
        print(f'\nNumber of attempts remaining: {tries}')
        while True:
            try:
                guess = int(input(f'Guess a number between {start} and {stop}: '))
                if guess >= start and guess <= stop:
                    break
                print("Number entered was not in range.")
            except:
                print("Number entered was not a valid integer.")
        if guess == target:
            print(f"\nCongratulations! You guessed it! The number was: {target}")
            return
        elif guess < target:
            print('\nGuess higher!')
        else:
            print('\nGuess lower!')
        tries -= 1
    print(f"\nGame Over! You ran out of attempts. The number was: {target}")

def guess_random_num_linear(tries, start, stop):
    target = random.randint(start, stop)
    for i in range(start, stop):
        if tries == 0:
            break    
        print(f'Number of attempts remaining: {tries}')
        print(f"The computer guessed: {i}")
        if i == target:
            print(f"\nThe computer guessed it! The number was: {target}")
            return
        tries -= 1
    print(f"\nGame Over! The computer ran out of attempts. The number was: {target}")

def guess_random_num_binary(tries, start, stop):
    target = random.randint(start, stop)
    low = start
    high = stop
    pivot = ((high - low) // 2) + low
    while tries != 0:
        print(f'Number of attempts remaining: {tries}')
        print(f"The computer guessed: {pivot}")
        if pivot == target:
            print(f"\nThe computer guessed it! The number was: {target}")
            return
        elif pivot < target:
            low = pivot
        else:
            high = pivot
        pivot = ((high - low) // 2) + low
        tries -= 1
    print(f'\nGame Over! The computer ran out of attempts. The number was: {target}')

tries = int(input('\nWelcome to the number guessing game!\nHow many attempts would you like to play with? '))
start = int(input('What is your start value? '))
stop = int(input("What is your stop value? "))
while True:
    method = int(input("\nPlease enter a number for your preferred method of play.\n1.) User input\n2.) Linear Search\n3.) Binary Search\n"))
    if method == 1:
        guess_random_number(tries, start, stop)
        break
    elif method == 2:
        guess_random_num_linear(tries, start, stop)
        break
    elif method == 3:
        guess_random_num_binary(tries, start, stop)
        break
    print('\nInvalid choice. Please choose from the list of options')
