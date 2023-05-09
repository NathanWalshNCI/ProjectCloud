class Article < ApplicationRecord
	scope :published, -> { where(published: true) }
	scope :unpublished, -> { where(published: false) }
end
