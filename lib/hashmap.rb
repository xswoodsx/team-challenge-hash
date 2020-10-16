require_relative 'binary.rb'

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

  def array_of_hash_keys(hash)
    hash.keys.map { |key| key.to_s }
  end

  def check_index_availability(index)
    animal_hash_array[index].nil?
  end

  def check_keys_exists(keys_to_check)
    bin_array_ind = binary_count_of_string(keys_to_check)

    check_exists = bin_array_ind.map do |i|
      animal_hash_array[i].keys if animal_hash_array[i]
    end .flatten

    check_exists.map { |key_name| keys_to_check.include?(key_name) }.include?(true)
  end

  def get_hash(string)
    animal = string[0]
    index = binary_count_of_string(string)

    animal_hash = animal_hash_array[index[0]] 

    animal_hash[animal]
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
  {"name": "Lemur", "legs":4, "likes":["insects", "fruit"] }, 
  {"name": "Goat", "legs":4, "likes":["grass"] }, 
  {"name": "Snake", "legs":0, "likes":["insects", "eggs"]},
  {"name": "Deer", "legs":4, "likes":["grass"]},
  {"name": "Armadillo", "legs":4, "likes":["insects", "scorpions"] },
  {"name": "Steer", "legs":4, "likes":["corn", "oats"] },
  {"name": "Tiger", "legs":4, "likes":["meat"] },
  {"name": "Guanaco", "legs":4, "likes":["grass"] },
  {"name": "Otter", "legs":4, "likes":["fish"] },
  {"name": "Mole", "legs":4, "likes":["worms"] },
  {"name": "Civet", "legs":4, "likes":["mice", "eggs"] },
  {"name": "Dugong", "legs":0, "likes":["seagrass"] }
]

animal_key.each_with_index do |key, index|
  @hasher.add_animals_to_array(key, animal_value[index])
end

puts @hasher.animal_hash_array
