class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :taker, class_name: User
  belongs_to :answer, class_name: Answer
  belongs_to :question, class_name: Question
  validates :question_id, uniqueness: {scope: :taker_id}
end
