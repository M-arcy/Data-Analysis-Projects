class Stadium:
    """This class represents a Stadium"""
    def __init__ (self, name, city_state, capacity):
        """Initializer of stadium class"""
        self.name = name  #this property represents stadium name.
        self.city_state = city_state #this property represents stadium location
        self.capacity = capacity #this prop represents how many ppl it holds
    def describe_stadium(self):
        """tells us all about the stadium"""
        print("The" + self.name.title() + "is located in" + self.city_state + "and holds " + self.capacity + "fans.")
    def sport_played(self):
        print("The following sport is mainly played in this stadium:" + self.sport_played)
    def seats_available(self):
        print ("There are " + seats_available + "seats still available for tonight's game.")
stadium1 = Stadium("mercedes benz arena", "Atlanta, GA", 70000)
print("The", stadium1.name.title(), "is located in", stadium1.city_state, "and holds", stadium1.capacity, "fans.")

#Part 2
footballsport_played = Stadium('Football')
seats_available = Stadium('15000')
print("The following sport is mainly played in this stadium:", Stadium.sport_played)
print("There are", Stadium.seats_available, "seats still available for tonight's game.")


class Restaurant:
    """This class represents a Restaurant"""
    def __init__ (self, name, city_state, capacity):
        """Initializer of Restaurant class"""
        self.name = name  #this property represents the Restaurant name.
        self.city_state = city_state #this property represents restaurant location
        self.capacity = capacity #this property represents how many people it holds
    def describe_stadium(self):
        """tells us all about the restaurant"""
        print("The" + self.name.title() + "is located in" + self.city_state + "and holds " + self.capacity + "diners.")
    def cuisine(self):
        print("The following cuisine is mainly served in this restaurant:" + self.cuisine)
    def seats_available(self):
        print ("There are " + seats_available + "seats still available for tonight's dinner service.")
restaurant1 = Restaurant("Le Coq Au Vin", "Paris, France", 200)
print("The", restaurant1.name.title(), "is located in", restaurant1.city_state, "and holds", restaurant1.capacity, "guests.")