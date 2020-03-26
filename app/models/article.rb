class Article < ApplicationRecord

	has_many :comments, :dependent => :delete_all
	has_many :taggings, :dependent => :delete_all

	has_many :tags, through: :taggings, :dependent => :delete_all

	belongs_to :author

	mount_uploader :avatar, ImageUploader

	validates :title, presence: true,length: {minimum: 5}
	validates :description,presence: true, length: {
	 			 maximum: 350	  			
			}

	

	def tag_list
		self.tags.collect do |t|
			t.name
		end.join(", ")
	end

	def tag_list=(tags_string)
		tags_name = tags_string.split(",").collect{|c|c.strip.downcase}.uniq
		new_or_found_tags = tags_name.collect {|name| Tag.find_or_create_by(name: name)}
		self.tags = new_or_found_tags
		
	end
end
