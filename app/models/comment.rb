class Comment < ActiveRecord::Base

belongs_to :users
belongs_to :projects

end
