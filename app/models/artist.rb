class Artist < ActiveRecord::Base
	has_attached_file :artpic,
		:styles => { 
		:medium => "300x300>", 
		:thumb => "250x250>" 
		} # #= cropped exactly, >= no side will be longer than another, not exact crops

	validates_attachment_content_type :artpic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :fname, presence: true
    validates :lname, presence: true 
    validates :email, presence: true 
    validates :bio, presence: true
    validates :title, presence: true
    validates :location, presence:true



end
