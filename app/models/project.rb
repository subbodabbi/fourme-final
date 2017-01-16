class Project < ActiveRecord::Base

  belongs_to :developers
  belongs_to :projects

  validates :title, presence: true

end
