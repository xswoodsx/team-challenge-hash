require './lib/binary.rb'

describe 'test methods on each of binary class' do
  it 'returns an array of a string convert to binary with each index the binary conversion of that letter' do
    bin = Binary.new

    str = 'cat'

    actual = bin.convert_string_to_binary(str)

    expect(actual).to eql(%w[1100011 1100001 1110100])
  end

  it 'returns the final char of each string' do
    bin = Binary.new
    string_array = %w[one two three]
    actual = bin.final_char_of_each_string_in_array(string_array)

    expect(actual).to eql(%w[e o e])
  end

  it 'return an array flattened and joined to single string' do
    bin = Binary.new
    string_array = %w[e o e]

    actual = bin.flatten_and_join_string_array(string_array)
    expect(actual).to eql('eoe')
  end

  it 'returns an array of binary count for key ' do
    bin = Binary.new
    str = 'cat'
    bin_count_array = bin.binary_count_of_string(['cat'])
    expect(bin_count_array[0]).to eql(2)
  end
end
