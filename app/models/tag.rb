class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :posts, through: :taggings

	def self.counts
	  self.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id, tags.id")
	end
end
