class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:twitter, :facebook, :google_oauth2]

  validates :fname, presence: true
  validates :lname, presence: true 


  def self.find_or_create_for_twitter_oauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.email = auth.info.nickname + "@twitter.com"
  		user.fname, user.lname = auth['info']['name'].split(' ', 2)
  		user.password = Devise.friendly_token[0,20]
  	end
  	
  end


  def self.find_or_create_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.fname = auth.info.first_name
        user.lname = auth.info.last_name
        user.password = Devise.friendly_token[0,20]
    end
  end


  def self.find_or_create_for_google_oauth2(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email 
        user.fname, user.lname = auth['info']['name'].split(' ', 2)
        user.password = Devise.friendly_token[0,20]
    end
  end


end
