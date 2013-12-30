class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :institutes

  has_many :authentications

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def apply_omniauth(omniauth)
    self.email = omniauth.info.email if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

end
