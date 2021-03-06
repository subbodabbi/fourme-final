class Developer < ActiveRecord::Base

  belongs_to :users
  has_many :projects

  mount_uploader :avatar, AvatarUploader  
  
  acts_as_votable

  validates :name, presence: true 
  validates :skills, presence: true
  validates :motto, presence: true    

end
