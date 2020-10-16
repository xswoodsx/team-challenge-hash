require './lib/hashmap.rb'

describe 'a class that adds, check exists and retrieves key, value pairs in an array' do
  it 'initialises an empty array with 10 empty values' do
    hash = HashMap.new
    expect(hash.animal_hash_array.length).to eql(10)
  end

  it 'returns an array of indexs with which to insert a hash, passing a single hash' do
    hash = HashMap.new
    key = 'Lemur'
    value = { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }
    hash_keys = hash.array_of_hash_keys(key, value)
    binary_index_num = hash.binary_count_of_string(hash_keys)

    expect(binary_index_num).to eql([3])
  end

  it 'returns an array of indexes with which to insert a hash, passing multiple hashes' do
    hash = HashMap.new
    animal_hash = { "Lemur": { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }, "Cat": { "name": 'Cat', "legs": 4, "likes": ['cat food'] } }

    hash_keys = hash.array_of_hash_keys(animal_hash)

    binary_index_num = hash.binary_count_of_string(hash_keys)

    expect(binary_index_num).to eql([3, 2])
  end

  it 'adds an animal at the index the binary count has returned' do
    hash = HashMap.new

    key = 'Lemur'
    value = { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }

    hash.add_animals_to_array(key, value)

    expect(hash.animal_hash_array[3]).to eql({ 'Lemur' => { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] } })
  end

  it 'checks that the key already exists in the hash array, returning true' do
    hash = HashMap.new
    key = 'Lemur'
    value = { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }

    animal_hash = { 'Lemur' => { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] } }

    hash.add_animals_to_array(key, value)

    expect(hash.check_keys_exists([key])).to eql(true)
  end

  it 'checks that a key does not exist in the hash array, returning false' do
    hash = HashMap.new
    key = 'Lemur'
    value = { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }

    wrong_animal = ['Monkey']

    hash.add_animals_to_array(key, value)

    expect(hash.check_keys_exists(wrong_animal)).to eql(false)
  end

  it 'checks that a multiple keys does exist in the hash array, returning true for all hashes' do
    hash = HashMap.new
    key = 'Lemur'
    value = { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }

    hash.add_animals_to_array(key, value)

    key = 'Monkey'
    value = { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }

    hash.add_animals_to_array(key, value)

    animal_to_check = ['Lemur']

    expect(hash.check_keys_exists(animal_to_check)).to eql(true)
  end

  it 'adds multiple hashes to the same index in the hash array' do
    hash = HashMap.new

    key = 'cat'
    value = { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }

    hash.add_animals_to_array(key, value)

    key = 'dog'
    value = { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }

    hash.add_animals_to_array(key, value)

    expect(hash.animal_hash_array[2]).to eql({ 'cat' => { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }, 'dog' => { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] } })
  end

  it 'checks whether the key exists when two hashes exists on the same index' do
    hash = HashMap.new

    key = 'cat'
    value = { "name": 'cat', "legs": 4, "likes": %w[insects fruit] }

    hash.add_animals_to_array(key, value)

    key = 'dog'
    value = { "name": 'dog', "legs": 4, "likes": %w[insects fruit] }

    hash.add_animals_to_array(key, value)

    expect(hash.check_keys_exists(['dog'])).to eql(true)
  end

  it 'gets the hash for the value passed' do
    hash = HashMap.new
    key = 'cat'
    value = { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] }
    hash.add_animals_to_array(key, value)

    animal_hash = { 'cat' => { "name": 'Lemur', "legs": 4, "likes": %w[insects fruit] } }

    actual = hash.get_hash(['cat'])
    expect(actual).to eql(animal_hash)
  end
end
