donation_num = 0
donation_total = 0

def show_homepage():
    print('\n       === DonateMe Homepage ===')
    line = '-------------------------------------------'
    print(line)
    print('| 1.   Login       | 2.   Register        |')
    print(line)
    print('| 3.   Donate      | 4.   Show Donations  |')
    print(line)
    print('|              5.   Exit                  |')
    print(line)
    
def donate(username):
    global donation_num
    global donation_total

    while True:
        donation_amt = input('\nEnter amount to donate: ')
        try:
            donation_num = float(donation_amt)
        except:
            print('Donation amount must be a number.')
            continue
        else:
            if donation_num > 0:
                donation_total += donation_num
                break
            else:
                print('Donation amount must be greater than zero.')
    donation_string = username + ' donated $' + donation_amt
    print('Thank you, ' + username + '!')
    return donation_string

def show_donations(donations):
    global donation_total

    print('\n--- All Donations ---')
    if len(donations) == 0:
        print('Currently, there are no donations.')
    else:
        for item in donations:
            print(item)
        print('Total: $' + str(donation_total))
