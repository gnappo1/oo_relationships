class Pet
    attr_accessor :name, :age, :breed, :person
    attr_reader :species
    @@all = []

    def initialize(name= "unknown", age= nil, species)
        self.name, self.age, @species = name, age, species
    end

    def self.all
        @@all
    end

    def self.create
        pet = Pet.new #instantiate
        pet.save #persist/store inside the class array
        pet
    end

    def self.create_by_name_and_species(name, species)
        pet = Pet.new(name, species) #instantiate
        pet.save #persist/store inside the class array
        pet
    end

    def self.new_by_name(name)
        Pet.new(name)
    end

    def save
        self.class.all << self
    end
end