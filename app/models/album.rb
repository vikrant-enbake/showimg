class Album < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  belongs_to :user
  has_many :pics , dependent: :destroy
  validates :name, presence: true
  accepts_nested_attributes_for :pics,:reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
end
