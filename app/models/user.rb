class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  extend EnumerateIt
  has_enumeration_for :role
  has_many :requests, :foreign_key => :responder_id
  has_many :requests, :foreign_key => :creator_id
  has_many :requests, :foreign_key => :approver_id
  has_many :requests, :foreign_key => :decided_by

has_many :requestlogs, :foreign_key => :user_id




  def pillar_staff(current_user)
    p=[1,4]
    if p.include? current_user
      return true
    else
      return false


    end
  end

end
