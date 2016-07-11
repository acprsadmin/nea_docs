class NeaDecision < EnumerateIt::Base
  associate_values(
      :approved  => 1,
      :rejected  => 2,
      :more_info_required => 3,
      :on_hold => 4
  )
end