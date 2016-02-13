class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :taker, class_name: User
  belongs_to :answer, class_name: Answer
end
