class Book < EnumerateIt::Base
  associate_values(
      :general  => 0,
      :nea  => 1,
      :implementer  => 2
  )
end