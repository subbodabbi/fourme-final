class User < ActiveRecord::Base
  include Clearance::User

  has_one :developers   
  has_many :comments

end
