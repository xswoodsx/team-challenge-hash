require './lib/hashmap.rb'
require './lib/animal.rb'

describe 'a class that adds, check exists and retrieves key, value pairs in an array' do
  it 'initialises an empty array with 10 empty values' do
    hash = HashMap.new
    expect(hash.animal_hash_array.length).to eql(10)
  end


  it 'returns an array of indexes with which to insert a hash, passing multiple hashes' do
    hash = HashMap.new
    lemur = Animal.new('Lemur', 4, 'insects', 'fruit')
    cat = Animal.new('Cat', 4, 'cat food')
    hash_keys = hash.array_of_hash_keys(cat, lemur)

    binary_index_num = hash.binary_count_of_string(hash_keys)

    expect(binary_index_num).to eql([6, 5])
  end

  it 'adds an animal at the index the binary count has returned' do
    hash = HashMap.new
    value = Animal.new('Lemur', 4, "insects", "fruit")
    key = 'Lemur'

    hash.add_animals_to_array(key, value.to_hash)
    
    expect(hash.animal_hash_array[5]).to eql({ 'Lemur' => { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] } })
  end

  it 'checks that the key already exists in the hash array, returning true' do
    hash = HashMap.new
    key = 'Lemur'
    value = Animal.new('Lemur', 4, "insects", "fruit")
    hash.add_animals_to_array(key, value.to_hash)

    expect(hash.check_keys_exists(key)).to eql(true)
  end

  it 'checks that a key does not exist in the hash array, returning false' do
    hash = HashMap.new
    key = 'Lemur'
    value = Animal.new('Lemur', 4, "insects", "fruit")

    wrong_animal = 'Monkey'

    hash.add_animals_to_array(key, value)

    expect(hash.check_keys_exists(wrong_animal)).to eql(false)
  end

  it 'checks that a multiple keys does exist in the hash array, returning true for all hashes' do
    hash = HashMap.new
    key = 'Lemur'
    value = Animal.new('Lemur', 4, "insects", "fruit")

    hash.add_animals_to_array(key, value.to_hash)

    key = 'Monkey'

    value = Animal.new('Lemur', 4, "insects", "fruit")

    hash.add_animals_to_array(key, value.to_hash)

    animal_to_check = 'Lemur'

    expect(hash.check_keys_exists(animal_to_check)).to eql(true)
  end

  it 'adds multiple hashes to the same index in the hash array' do
    hash = HashMap.new

    key = 'cat'
    value = Animal.new('cat', 4, "meat", "fish")

    hash.add_animals_to_array(key, value.to_hash)

    key = 'dog'
    value = Animal.new("dog", 4, "dog bones", "pigs ears", "not chocolate")

    hash.add_animals_to_array(key, value.to_hash)

    expect(hash.animal_hash_array[6]).to eql({ 'cat' => { "name": 'cat', "legs": 4, "likes": %w[meat fish] }, 'dog' => { "name": 'dog', "legs": 4, "likes": ["dog bones", "pigs ears", "not chocolate"] }})
  end

  it 'checks whether the key exists when two hashes exists on the same index' do
    hash = HashMap.new

    key = 'cat'
    value = Animal.new('cat', 4, "meat", "fish")

    hash.add_animals_to_array(key, value.to_hash)

    key = 'dog'
    value = Animal.new("dog", 4, "dog bones", "pigs ears", "not chocolate")

    hash.add_animals_to_array(key, value.to_hash)

    expect(hash.check_keys_exists('dog')).to eql(true)
  end

  it 'gets the hash for the value passed' do
    hash = HashMap.new
    key = 'cat'
    value = Animal.new('cat', 4, "meat", "fish")
    hash.add_animals_to_array(key, value.to_hash)
    animal_hash = [{ "name": 'cat', "legs": 4, "likes": %w[meat fish] }]
    actual = hash.get_hash('cat')
    expect(actual).to eql(animal_hash)
  end
   it 'gets the hash for multiple values passed in' do
    hash = HashMap.new
    key = 'cat'
    value = Animal.new('cat', 4, "meat", "fish")
    hash.add_animals_to_array(key, value.to_hash)

    key = 'lemur'
    value = Animal.new('lemur', 4, "insects", "fruit")
    hash.add_animals_to_array(key, value.to_hash)

    animal_hash = [{ "name": 'cat', "legs": 4, "likes": %w[meat fish] }, { "name": 'lemur', "legs": 4, "likes": %w[insects fruit] } ]
    actual = hash.get_hash('cat', 'lemur')
    expect(actual).to eql(animal_hash)
  end
end
