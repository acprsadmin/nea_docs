class Acprsrole < EnumerateIt::Base
    associate_values(
        :gms  => 1,
        :po  => 2,
        :go => 3,
        :admin => 4,
        :pillar => 5
    )
end
