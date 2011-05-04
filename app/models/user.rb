class User < ActiveRecord::Base
  has_attached_file :photo
end
