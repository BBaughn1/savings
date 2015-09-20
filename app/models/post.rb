class Post < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true

	has_attached_file :image, :styles => { large: '600x600>', medium: '300x300>', thumb: '150x150#' }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	extend FriendlyId
	friendly_id :title, use: :slugged
end
