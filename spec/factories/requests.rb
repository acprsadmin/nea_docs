FactoryGirl.define do
  factory :request do
    name "MyString"
submitted_on "2016-04-22"
role 1
submitter_id 1
requesttype 1
urgent false
subject "MyString"
description "MyText"
response "MyText"
impact_hour 1
impact_duration "MyString"
impact_schedule "MyString"
approved false
approver_id 1
approved_on "2016-04-22"
decision 1
decided_on "2016-04-22"
decisiontext "MyText"
conditions "MyText"
decided_by 1
  end

end
