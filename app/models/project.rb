class Project < ActiveRecord::Base

  acts_as_votable

  belongs_to :developers
  has_many :comments

  validates :title, presence: true
  validates :languages_required, presence: true

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

end
