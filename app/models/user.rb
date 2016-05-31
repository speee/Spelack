class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :user_channels
  has_many :channels, through: :user_channels
  has_many :messages


  validates :nickname, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :middle_name, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/default_avatar.png'

  after_create do
    self.channels << Channel.find(1)
  end

  protected
  def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first


    unless user
      user = User.create(name:     auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         email:    auth.info.email,
                         meta:     auth.to_yaml)
    end
  end
end
