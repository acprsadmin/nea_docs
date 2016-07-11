class Role < EnumerateIt::Base
  associate_values(
      :admin  => 1,
      :editor  => 2,
      :nea_staff => 3,
      :pillar_staff => 4  )
end