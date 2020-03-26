class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author
  has_many :replies, :dependent => :delete_all
end
