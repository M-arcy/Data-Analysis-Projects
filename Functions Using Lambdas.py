#create 3 functions that accept three parameters 
numeros = [1, 2, 3, 4, 5, 6, 7, 8]

"""This function adds numbers in the list of numeros/numbers"""

def sum_function (): 
    return sum(numeros)
result = sum(numeros)
print (result)


#product 

def product_function (number1, number2, number3):
    return number1 * number2 * number3
    print(product_function(2, 6, 9))

#average 
numbers = [2, 3, 4]
def average_function (int1, int2, int3):
    return (int1 + int2 + int3) / 3
    print(average_function (5, 7, 8))

#PART 2

#create three lambdas that do the same thing as function in Part 1
#sum of numeros with lambda 
add_numbers = lambda num1, num2, num3 : num1 + num2 + num3
print(add_numbers(32, 9, 54))


#product with lambda 

multiply_numbers = lambda nbr1, nbr2, nbr3 : nbr1 * nbr2 * nbr3 
print(multiply_numbers(1, 4, 80)) 

#average with lambda 
average_numbers = lambda integer1, integer2, integer3 : (integer1 + integer2 + integer3) / 3
print(average_numbers(4, 6, 7))

#PART 3
list_one = [4, 6, 88, 24]
list_two = [17, 34, 9, 5]
list_three = [63, 20, 98, 4]

average_maker = lambda num1, num2, num3 : (num1 + num2 + num3) / 3
map_results = map(average_maker, list_one, list_two, list_three)
print(list(map_results))
