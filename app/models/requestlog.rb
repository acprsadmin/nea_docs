class Requestlog < ActiveRecord::Base
  belongs_to :request
  belongs_to :user

  extend EnumerateIt
  has_enumeration_for :nea_decision
end
