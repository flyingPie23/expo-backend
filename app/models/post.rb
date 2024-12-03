class Post < ApplicationRecord

  validates :meduim, :presence => true, :inclusion => { :in => ["2d", "3d", "Canvas", "Degital"].join(' ') }
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user
end
