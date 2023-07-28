module Convert
  def char_to_bool(char)
    if char.downcase == 'y'
      true
    elsif char.downcase == 'n'
      false
    end
  end
end
