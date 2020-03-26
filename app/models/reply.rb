class Reply < ApplicationRecord
  belongs_to :comment
  validates :name, presence: true,
                    length: { minimum: 5 }
end
