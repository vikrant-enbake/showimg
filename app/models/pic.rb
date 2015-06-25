class Pic < ActiveRecord::Base
  belongs_to :album
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
end
