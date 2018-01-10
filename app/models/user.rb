class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers =>[:twitter, :facebook,:google_oauth2]

  has_many :wishlists, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy

  after_create :welcome_user

  def self.from_omniauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.info.email == nil || auth.info.email == ""
        user.email = "#{auth.uid}@home.com"
        user.password = Devise.friendly_token[0,20]
        user.firstname = auth.info.name   # assuming the user model has a name
      else
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.firstname = auth.info.name   # assuming the user model has a name
      end
    end
  end

  def password_required?
    super && provider.blank?
  end

  def welcome_user
    UserMailer.user_created(self).deliver_now
  end
 
end

