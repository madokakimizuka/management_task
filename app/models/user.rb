class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  before_validation { email.downcase! }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  has_many :tasks, dependent: :destroy

  before_destroy :left_admin_user

  private
  def left_admin_user
    if User.select('admin').where('admin = true').length == 1
      throw(:abort)
    end
  end
end
