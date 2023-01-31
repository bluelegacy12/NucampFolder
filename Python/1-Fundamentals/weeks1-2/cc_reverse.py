def reverse(str):
    new_string = ''
    for i in range(len(str) - 1, -1, -1):
        new_string += str[i]
    return new_string

name = input("What is your name? ")
print("Your name reversed is:", reverse(name))
