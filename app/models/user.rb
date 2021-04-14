class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :invitations, dependent: :destroy
  has_many :pending_invitations, -> { where  confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"
  has_many :post, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile
  has_one_attached :avatar

  after_create :send_welcome_mail

  def send_welcome_mail
    UserMailer.welcome_email(self).deliver
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def friends
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  def accept_invitation(user)
    pending_invitations.find_by(user_id: user.id).update_attribute(:confirmed, "true")
  end

  def invitation_sent(user) 
    Invitation.where(user_id: id, friend_id: user.id, confirmed: false)
  end

end
