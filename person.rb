class Person
    attr_accessor :name, :age
    # attr_reader :pets, :breeds
    @@all = []

    def initialize(name = "unknown", age = nil)
        self.name, self.age = name, age
        # save #automatic saving
    end

    def pets
        Pet.all.select {|pet| pet.person == self}
    end

    def breeds
        # pets.map {|pet| pet.breed }
        pets.map(&:breed)
    end

    def save
        self.class.all << self
    end

    def self.create
        person = Person.new #instantiate
        person.save #persist/store inside the class array
        person #return the person instantiated
    end

    def self.create_by_name(name)
        person = Person.new(name) #instantiate
        person.save #persist/store inside the class array
        person #return the person instantiated
    end

    def self.new_by_name(name)
        Person.new(name)
    end

    def self.all
        @@all
    end
end