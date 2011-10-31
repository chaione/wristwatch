class Numeric
  def divisible_by?(int, offset = 0)
    modulo(int) == offset
  end
end
