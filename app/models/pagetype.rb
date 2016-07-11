class Pagetype < EnumerateIt::Base
  associate_values(
      :content  => 0,
      :appendix  => 1,
      :acronym  => 2,
      :definition  => 3,
      :no_number => 4,
      :cover => 5,
      :screen_shot => 6



  )
end