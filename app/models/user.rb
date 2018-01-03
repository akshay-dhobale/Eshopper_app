class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: %i[twitter]

  has_many :wishlists
  has_many :addresses
  has_many :carts
  has_many :orders

  after_create :welcome_user

  # after_create :products_in_cart

  def self.from_omniauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.firstname = auth.info.name   # assuming the user model has a name
     # binding.pry
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.twitter_data"] && session["devise.twitter_data"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def password_required?
    super && provider.blank?
  end

  def welcome_user
    UserMailer.user_created(self).deliver_now
  end
  
  def products_in_cart
    # b =  session.keys 
    # @p = b.map(&:to_i)
    # @p.each do |product_id|
    #   if product_id != 0
    #     @cart = Cart.find_by(product_id: product_id, user_id: current_user.id)
    #     if @cart.present?
    #       @cart.quantity += 1
    #     else
    #       @cart = Cart.create(product_id: product_id, user_id: current_user.id, quantity: session[product_id.to_s])
    #     end
    #     @cart.save!
    #     session.delete(product_id.to_s)
    #   end
    # end
  end
end

