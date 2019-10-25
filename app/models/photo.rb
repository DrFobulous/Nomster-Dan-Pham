class Photo < ApplicationRecord::Base
    mount_uploader :picture, PictureUploader
    belongs_to :user
    belongs_to :place 
end
