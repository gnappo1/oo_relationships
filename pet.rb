class Pet
    attr_accessor :name, :age, :breed, :person
    attr_reader :species

    @@all = []

    def initialize(name = "unknown", age = 0, species)
        self.name, self.age, @species = name, age, species
    end

    # class methods

    def self.all
        @@all
    end

    def self.create
        self.new.tap{|pet| pet.save}
    end

    def self.create_by_name_and_species(name, species)
        self.new(name, species).tap{|pet| pet.save}
    end

    def self.new_by_name(name)
        self.new(name)
    end

    def self.find_by_name_and_species(name, species)
        self.all.find {|pet| pet.name == name && pet.species == species}
    end

    def self.find_or_create_by_name_and_species(name, species)
        self.find_by_name_and_species(name, species) or self.create_by_name_and_species(name, species)
    end

    # instance methods
    
    def save
        self.class.all << self
    end


end