class Binary
  def binary_count_of_string(array)
    count = array.map do |string|
      binary_digits = convert_string_to_binary(string)

      index =  binary_sum(binary_digits) * string.length
      
      index % 10 
    end
    count
  end

  def convert_string_to_binary(str)
    str.unpack('C*').map { |e| 
     e.to_s 2 }.map(&:to_i)
  end

  def binary_sum(array)
    array.reduce(:+)
  end
end
