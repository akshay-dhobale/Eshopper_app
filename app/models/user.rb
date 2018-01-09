class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # devise :omniauthable, omniauth_providers: %i[twitter]
  # devise :omniauthable, omniauth_providers: %i[facebook]
  devise :omniauthable, :omniauth_providers =>[:twitter, :facebook,:google_oauth2]


  has_many :wishlists, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy

  after_create :welcome_user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.firstname = auth.info.name   # assuming the user model has a name
    end
  end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.twitter_data"] && session["devise.twitter_data"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  # def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
  #   data = access_token.info
  #   user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
  #   if user
  #     return user
  #   else
  #     registered_user = User.where(:email => access_token.info.email).first
  #     if registered_user
  #       return registered_user
  #     else
  #       user = User.create(name: data["name"],
  #         provider:access_token.provider,
  #         email: data["email"],
  #         uid: access_token.uid ,
  #         password: Devise.friendly_token[0,20],
  #       )
  #     end
  #  end
  # end

  def password_required?
    super && provider.blank?
  end

  def welcome_user
    UserMailer.user_created(self).deliver_now
  end
 
end

