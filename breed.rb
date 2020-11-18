class Breed
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
    end

    def pets
        Pet.all.select {|pet| pet.breed == self}
    end

    def persons
        pets.map {|pet| pet.person}
    end

    def save
        self.class.all << self
    end

    def self.create
        breed = new
        breed.save
    end

    def self.create_by_name(name)
        breed = new(name)
        breed.save
    end

    def self.new_by_name(name)
        new(name)
    end

    def self.find_or_create_by_name(name)
        # maybe_breed = all.find {|breed| breed.name == name}
        # maybe_breed ? maybe_breed : create_by_name(name)
        all.find {|breed| breed.name == name} || create_by_name(name)
    end

    def self.all
        @@all
    end

end