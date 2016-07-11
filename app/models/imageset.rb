class Imageset < EnumerateIt::Base
  associate_values(
      :na  => 0,
      :top  => 1,
      :bottom  => 2
  )
end