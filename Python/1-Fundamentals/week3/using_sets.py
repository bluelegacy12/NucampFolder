# numbers_set = {1, 2, 3, 4, 4}  # duplicate vaules removed
# numbers_set = {1, 2, 3, 4, (5, 6)}  # tuples are OK because they are immutable
# print(numbers_set)
# sets are randomly listed values and printing a set will always give a different order and will always eliminate duplicates

words_set = {'Alpha', 'Bravo', 'Charlie'}
abcd = ''
for word in words_set:
    abcd += word
# print(abcd)
"""
if 'Alpha' in words_set:
    print('Alpha is in set')
else: 
    print('Alpha is not in set.')
"""
words_set.add('Delta')
words_set.discard('Bravo')
print(words_set)
