class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :maker, class_name: 'User'
  has_many :questions

end
