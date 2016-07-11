class Section < ActiveRecord::Base
  belongs_to :level

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  extend EnumerateIt
  has_enumeration_for :imageset
  has_enumeration_for :book
  has_enumeration_for :pagetype

  acts_as_commentable
  has_many :comments



  def getidfromord(ordernum)
    puts ordernum
    puts '======================================================='
    getid=Section.find_by_ordernum(ordernum)
    return getid
  end





end
