class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :async

  has_many :accounts

  def admin?
    admin
  end
end
