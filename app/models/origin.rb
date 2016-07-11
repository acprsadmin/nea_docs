
class Origin < EnumerateIt::Base
  associate_values(
      :request  => 1,
      :recommendation  => 2
  )
end