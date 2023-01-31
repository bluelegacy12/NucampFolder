import random

diamonds = ["AD", "2D", "3D", "4D", "5D", "6D",
            "7D", "8D", "9D", "10D", "JD", "QD", "KD"]
hand = []

while diamonds:
    choice = input('Press enter to pick a card or type "Q" to quit: ').lower()
    if choice == 'q':
        break
    draw = random.choice(diamonds)
    hand.append(draw)
    i = 0
    for card in diamonds:
        if card == draw:
            diamonds.pop(i)
            break
        i += 1
    print('Your hand:', hand)
    print('Remaining cards:', diamonds)

if not diamonds:
    print('There are no more cards to pick.')

