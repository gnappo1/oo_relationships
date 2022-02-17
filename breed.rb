class Breed
    
    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
    end

    # class methods

    def self.all
        @@all
    end

    def self.create
        self.new.tap{|breed| breed.save}
    end

    def self.create_by_name(name)
        self.new(name).tap{|breed| breed.save}
    end

    def self.new_by_name(name)
        self.new(name)
    end

    def self.find_by_name(name)
        self.all.find {|breed| breed.name == name}
    end
    
    def self.find_or_create_by_name(name)
        self.find_by_name(name) or self.create_by_name(name)
    end

    # instance methods
    
    def save
        self.class.all << self
    end

    def pets 
        Pet.all.select {|pet| pet.breed == self}
    end

    def persons
        # pets.map {|pet| pet.breed}
        pets.map(&:person)
    end


end