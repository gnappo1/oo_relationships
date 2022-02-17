require "pry"
class Person
    attr_accessor :name, :age
    
    # memoization
    @@all = []
    
    def initialize(name = "unknown", age = 0)
        self.name, self.age = name, age
    end

    # class methods

    def self.all
        @@all
    end

    def self.create
        self.new.tap{|person| person.save}
        # new_person.save
        # new_person
    end

    def self.find_by_name(name)
        self.all.find {|person| person.name == name}
    end

    def self.create_by_name(name)
        self.new(name).tap{|person| person.save}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) or self.create_by_name(name)
    end

    def self.new_by_name(name)
        self.new(name)
    end

    # instance methods
    
    def save
        self.class.all << self
    end

    def pets #coming from has-many relationship
        Pet.all.filter {|pet| pet.person == self}
    end

    def breeds #coming from has-many-through relationship
        pets.map(&:breed)
    end
    
    
end
