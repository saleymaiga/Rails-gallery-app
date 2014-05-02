class Artist < ActiveRecord::Base
	# before_save :price*100
	has_attached_file :artpic,
		 :styles => { 
		:medium => "300x300>", 
		 :thumb => "250x250>" 
		}  #= cropped exactly, >= no side will be longer than another, not exact crops

	validates_attachment_content_type :artpic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :fname, presence: true
    validates :lname, presence: true 
    validates :email, presence: true 
    validates :bio, presence: true
    validates :title, presence: true
    validates :location, presence:true
    validates :price, presence: true

    validates :price, :numericality => {:only_integer => true}

end
