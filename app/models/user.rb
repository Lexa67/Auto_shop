class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role, optional: true
  has_many :cars, dependent: :destroy
  validates :user_name, presence: true
  before_save :assign_role
  
  def assign_role
    self.role = Role.find_by role_name: 'Regular' if role.nil?
  end

  def admin?
    role.role_name == 'Admin'
  end

  def seller?
    role.role_name == 'Seller'
  end
  
  def regular?
    role.role_name == 'Regular'
  end
end
