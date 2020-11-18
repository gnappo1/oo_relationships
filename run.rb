require_relative './pet.rb'
require_relative './person.rb'
require_relative './breed.rb'

require 'pry'


matteo = Person.create_by_name("Matteo")
cernan = Person.create_by_name("Cernan")

poodle = Breed.create_by_name("Poddle")
setter = Breed.create_by_name("Setter")

molly = Pet.create_by_name_and_species("Molly", "Dog")
fido = Pet.create_by_name_and_species("Fido", "Dog")

molly.person = matteo
molly.breed = poodle

fido.person = cernan
fido.breed = setter

#inspect all the associations built by line 20 and 21:
 p molly.person
 p "-----"
 p molly.breed
 p "-----"
 p matteo.pets
 p "-----"
 p matteo.breeds
 p "-----"
 p poodle.pets
 p "-----"
 p poodle.persons
 p "-----"


 binding.pry