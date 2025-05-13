class SeoPage < ApplicationRecord
  validates :keyword, :slug, :meta_title, :meta_description, :headline, :subheading, :content, presence: true
  validates :slug, uniqueness: true
end
