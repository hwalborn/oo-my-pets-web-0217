require "pry"
class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish_name)
    new_fish = Fish.new(fish_name)
    @pets[:fishes]=@pets[:fishes]<<new_fish
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    @pets[:cats]=@pets[:cats]<<new_cat
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    @pets[:dogs]=@pets[:dogs]<<new_dog
  end

  def walk_dogs
    @pets[:dogs].map!{|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].map!{|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].map!{|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each_value{|value| value.map!{|pet| pet.mood = "nervous"}}
    @pets.clear
  end

  def list_pets
    arr = []
    @pets.each_value{|value| arr << value.count}
    "I have #{arr[0]} fish, #{arr[1]} dog(s), and #{arr[2]} cat(s)."
  end

  #////Class Methods////
  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end
end
