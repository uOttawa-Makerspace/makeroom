class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :staff, :brunsfield, :sandbox]

  def set_default_role
    self.role ||= :staff
  end

  def admin?
    if role == 'admin'
      return true
    else
      return false
    end
  end
end
