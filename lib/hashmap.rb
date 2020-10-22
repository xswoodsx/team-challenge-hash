require_relative 'binary.rb'
require_relative 'animal.rb'

class HashMap < Binary
  attr_accessor :animal_hash_array

  def initialize
    @animal_hash_array = Array.new(10)
  end
  def add_animals_to_array(key, value)
    index_of_key = binary_count_of_string([key])
    if check_index_availability(index_of_key[0]) == true
      animal_hash_array[index_of_key[0]] = Hash[key, value]
    else
      animal_hash_array[index_of_key[0]].merge!(Hash[key, value])
    end
  end

  def array_of_hash_keys(*hash_array)
    hash_array.map { |hash| hash.name }
  end

  def check_index_availability(index)
    animal_hash_array[index].nil?
  end

  def check_keys_exists(*keys_to_check)
    bin_array_ind = binary_count_of_string(keys_to_check)

    check_exists = bin_array_ind.map do |i|
      animal_hash_array[i].keys if animal_hash_array[i]
    end .flatten

    check_exists.map { |key_name| keys_to_check.include?(key_name) }.include?(true)
  end

  def get_hash(*animals)
    indexes = binary_count_of_string(animals)

    animal_hashes = animals.each_with_index.map{ | animal, index |
    
    animal_hash = animal_hash_array[indexes[index]] 
 
    animal_hash[animal]
  }
    animal_hashes
  end
end

@hasher = HashMap.new

animal_key = %w[Lemur Goat
                Snake
                Deer
                Armadillo
                Steer
                Tiger
                Guanaco
                Otter
                Mole
                Civet
                Dugong
                ]

animal_value = [
  Animal.new("Lemur", 4, "insects", "fruit"), 
  Animal.new("Goat", 4, "grass"), 
  Animal.new("Snake", 0, "insects", "eggs"),
  Animal.new("Deer", 4, "grass"),
  Animal.new("Armadillo", 4, "insects", "scorpions"),
  Animal.new("Steer", 4, "corn", "oats"),
  Animal.new("Tiger", 4, "meat"),
  Animal.new("Guanaco", 4, "grass"),
  Animal.new("Otter", 4, "fish"),
  Animal.new("Mole", 4, "worms"),
  Animal.new("Civet", 4, "mice", "eggs"),
  Animal.new("Dugong", 0, "seagrass")
]

animal_key.each_with_index do |key, index|
  @hasher.add_animals_to_array(key, animal_value[index].to_hash)
end

