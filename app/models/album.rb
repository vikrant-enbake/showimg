class Album < ActiveRecord::Base
  belongs_to :user
  has_many :pics , dependent: :destroy
  validates :name, presence: true
  accepts_nested_attributes_for :pics,:reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
end
