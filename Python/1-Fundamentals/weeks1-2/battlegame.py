import time
# I wanted a short delay between battle actions for readability so this import was necessary

# declare variables
wizard = 'Wizard'
elf = 'Elf'
human = 'Human'
wizard_hp = 70
elf_hp = 100
human_hp = 150
wizard_damage = 150
elf_damage = 100
human_damage = 20
dragon_hp = 300
dragon_damage = 50

while True:
    print('1) Wizard')
    print('2) Elf')
    print('3) Human')
    character = input('Choose your character: ')
    if character == '1' or character.lower() == 'wizard':
        character = wizard
        my_hp = wizard_hp
        my_damage = wizard_damage
        break
    elif character == '2' or character.lower() == 'elf':
        character = elf
        my_hp = elf_hp
        my_damage = elf_damage
        break
    elif character == '3' or character.lower() == 'human':
        character = human
        my_hp = human_hp
        my_damage = human_damage
        break
    else:
        print('Unknown character')

print('You have chosen: ', character)
print('Health: ', my_hp)
print('Damage: ', my_damage)
print('')
time.sleep(1.5)

while True:
    dragon_hp = dragon_hp - my_damage
    print('The ' + character + ' damaged the Dragon!')
    time.sleep(1.5)
    print("The Dragon's hitpoints are now:", dragon_hp)
    time.sleep(1.5)
    print('')
    
    if dragon_hp <= 0:
        print('The Dragon is slain! The ' + character + " has won the battle!")
        time.sleep(1.5)
        break
    my_hp = my_hp - dragon_damage
    print('The Dragon has damaged the ' + character + '!')
    time.sleep(1.5)
    print('The ' + character + "'s hitpoints are now:", my_hp)
    time.sleep(1.5)
    print('')
    
    if my_hp <= 0:
        print('The '+ character + ' has been slain by the Dragon! The ', character, ' has lost the battle.')
        time.sleep(1.5)
        break