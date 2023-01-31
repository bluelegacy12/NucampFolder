from sre_parse import State


state_capitals = {'Washington': 'Olympia', 'Oregon': 'Salem', 'California': 'Sacramento'}
'''
for state in state_capitals:
    print(state)
'''
'''
for city in state_capitals.values():
    print(city)
'''
#prints values of dictionary keys ^ the other method prints only keys

""" for state in state_capitals:
    print(state_capitals[state], 'is the capital of', state)
 """
for state, city in state_capitals.items():
    print(city, 'is the capital of', state)