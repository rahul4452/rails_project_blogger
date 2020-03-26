class Author < ApplicationRecord
  authenticates_with_sorcery!
  has_many :articles
  has_many :comments

  validates :username, :email, :password, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  validates :password, length: { in: 6..20}

  validates_confirmation_of :password ,message: "should match confirmation",  if: :password 

end
