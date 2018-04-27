require 'pry'

class Owner
  # code goes here
  @@owner = []
  @@owner_count = 0
  
  
  attr_reader :species
  attr_accessor :name, :pets

  
  def initialize(species)
      @species = species
      @pets = {fishes: [], cats: [], dogs: []}
      @@owner << self
      @@owner_count += 1
  end
  
  def self.all
    @@owner
  end

  def self.count
    @@owner_count
  end

  def say_species
      "I am a #{@species}."
  end
  
  def name
      @name
  end

  def self.reset_all
    @@owner.clear
    @@owner_count = 0
  end

  def buy_fish(name)
      self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
      self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
      self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
      self.pets[:dogs].map do |dog|
          dog.mood = "happy"
      end
  end

  def play_with_cats
      self.pets[:cats].map do |cat|
          cat.mood = "happy"
      end
  end

  def feed_fish
      self.pets[:fishes].map do |fish|
          fish.mood = "happy"
     end
  end

    def sell_pets
        @pets.map do |type, hash|
            hash.map do |pet|
                pet.mood = "nervous"
            end
        end
        @pets.clear
    end

    def list_pets
        fish_count = 0
        cat_count = 0
        dog_count = 0
        @pets.each do |key, value|
            fish_count = value.count if key == :fishes
                @pets.each do |key_2, value_2|
                    cat_count = value_2.count if key_2 == :cats
                        @pets.each do |key_3, value_3|
                            dog_count = value_3.count if key_3 == :dogs
                end
            end
        end
        "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
    end

end
