class Page < ActiveRecord::Base
	belongs_to :material
	acts_as_commentable
	acts_as_votable
	def page_path 
		"/uploads/#{self.material.class.to_s.underscore}/#{self.material.attachment.mounted_as.to_s.underscore}/#{self.material.id}/#{self.id}.png"
	end

end
