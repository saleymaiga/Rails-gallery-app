class Artist < ActiveRecord::Base
	has_attached_file :artpic,
		:styles => { 
		:medium => "300x300>", 
		:thumb => "250x250>" 
		} # #= cropped exactly, >= no side will be longer than another, not exact crop

	validates_attachment_content_type :artpic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
