class Image < ActiveRecord::Base
  has_attached_file :ATTACHMENT, :default_url => "/images/missing.png"

#  :url => "/public/system/attachment/:id/:basename.:extension",
 # :path => "rails_root/public/system/attachment/:style/:basename.:extension"
  #:styles => { :medium => "300x300>", :thumb => "100x100>" }
end
