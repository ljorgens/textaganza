class Contact < ActiveRecord::Base
  belongs_to :user

  validates :name, :presence => true
  validates :user_number, :presence => true
end
