class Project < ActiveRecord::Base

  belongs_to :developers
  belongs_to :projects

  validates :title, presence: true
  validates :languages_required, presence: true

end
