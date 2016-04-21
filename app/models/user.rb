class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 機能統合した段階で以下の外部キー制約の実装を行う。
  # has_many :channels
  # has_many :user_channels
  # has_many :chats
  # has_many :shared_files

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :middle_name, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
end
