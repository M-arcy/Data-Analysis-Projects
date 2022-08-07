Max = {
    'type' : 'dog',
    'color' : 'brown',
    'nickname' : 'boy',
    'owner' : 'Talia'
} 
Spot = {
    'type' : 'fish',
    'color' : 'orange',
    'nickname' : 'wetpet',
    'owner' : 'Olivia'
}
for key, value in Max.items():
    print (key, ": ", value),
for key, value in Spot.items():
    print (key, ": ", value)

#Part 2 
england = {'Capital': 'London'}
france = {'Capital': 'Paris'}
belgium = {'Capital': 'Brussels'}
england['population'] = '53.01 million'
france ['population'] = "66.9 million"
belgium['population'] = "11.35 million"
england['Interesting_Fact'] = (" ")
france['Interesting_Fact'] = (" ")
belgium['Interesting_Fact'] = (" ")
england['TopLanguageSpokenbyLocals'] =()
france['TopLanguageSpokenbyLocals'] =()
belgium['TopLanguageSpokenbyLocals'] = ()
for key, value in england.items():
    print (key, value),

for key, value in france.items():
    print ("Key : ", key, "\tValue: " , value),
for key, value in belgium.items():
    print ("Key : ", key, "\tValue: " , value),
    
#Part 3 add a dictionary that replicates a pizza order

pizza_order = {
    'name' : 'Andrew',
    'size' : 'small',
    'crust' : 'thin',
    'toppings' : ['extra cheese', 'sausage', 'bacon'],
    }
print("Thank you for your order, " , pizza_order.get('name'))
print("You have ordered a " , pizza_order.get('crust'), "-crust pizza with the following toppings:"),
print(pizza_order['toppings'])

