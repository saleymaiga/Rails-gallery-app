class Artist < ActiveRecord::Base
	has_attached_file :artpic,
		:styles => { 
		:medium => "300x300>", 
		:thumb => "250x250>" 
		} # #= cropped exactly, >= no side will be longer than another, not exact crop
  	
	do_not_validate_attachment_file_type :artpic
end
