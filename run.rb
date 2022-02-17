require_relative './person.rb'
require_relative './breed.rb'
require_relative './pet.rb'

require 'pry'


matteo = Person.find_or_create_by_name("Matteo")
cernan = Person.find_or_create_by_name("Cernan")

poodle = Breed.find_or_create_by_name("Poodle")
setter = Breed.find_or_create_by_name("Setter")

molly = Pet.find_or_create_by_name_and_species("Molly", "Dog")
fido = Pet.find_or_create_by_name_and_species("Fido", "Dog")

molly.person = matteo
molly.breed = poodle

fido.person = cernan
fido.breed = setter

#inspect all the associations built by line 20 and 21:
#  p molly.person
#  p "-----"
#  p molly.breed
#  p "-----"
#  p matteo.pets
#  p "-----"
#  p matteo.breeds
#  p "-----"
#  p poodle.pets
#  p "-----"
#  p poodle.persons
#  p "-----"


 binding.pry