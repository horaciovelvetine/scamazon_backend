class Answer < ApplicationRecord
  belongs_to :user, :question
end
