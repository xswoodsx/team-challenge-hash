class Binary
  def binary_count_of_string(array)
    array.map do |string|
      binary_digits = convert_string_to_binary(string)

      final_binary_digit = final_char_of_each_string_in_array(binary_digits)

      binary_str = flatten_and_join_string_array(final_binary_digit)

      binary_str.tr('0', '').length
    end
  end

  def convert_string_to_binary(str)
    str.unpack('C*').map { |e| e.to_s 2 }
  end

  def final_char_of_each_string_in_array(array)
    array.map { |string| string[-1] }
  end

  def flatten_and_join_string_array(array)
    array.flatten.join('')
  end
end
