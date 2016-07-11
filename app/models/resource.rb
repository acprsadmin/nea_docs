class Resource < ActiveRecord::Base
  #used for Globalize gem
  translates :title, :body
  globalize_accessors :locales => I18n.available_locales, :attributes => translated_attribute_names

  has_many :site_documents
  has_many :site_images


  acts_as_commentable
  has_many :comments


  searchable do

      text :title, :body, :publish_month
      time :published_at
      string :publish_month



      I18n.available_locales.each do |locale|
# Separate name field for each locale
        text "title_#{locale}".to_sym do
# read_Attribute is defined by Globalize.
          read_attribute(:title, locale: locale)
        end
        text "body_#{locale}".to_sym do
          read_attribute(:body, locale: locale)
        end
      end







  end



  def publish_month
   published_at
   #published_at.strftime("%B %Y")
  end

  def is_arabic
    vcount = Resource::Translation.where('locale = ? and resource_id = ?', 'ar', self.id).count
    if vcount > 0
      return true
    else
      return false
    end
  end

  def is_french
    vcount = Resource::Translation.where('locale = ? and resource_id = ?', 'fr', self.id).count
    if vcount > 0
      return true
    else
      return false
    end
  end












end
