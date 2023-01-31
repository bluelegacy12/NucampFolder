def login(database, username, password):
    if username in database and database[username] == password:
        print('\nWelcome, ' + username + '!')
        return username
    elif username in database and username != password:
        print('\nPassword is incorrect. Please try again.')
        return ''
    else:
        print('\nUsername does not exist. Please register an account.')
        return ''
    
def register(database, username):
    if username in database:
        print('\nUsername already registered.')
        return ''
    else:
        print('\n' + username + ' has been registered as a username.')
        return username