class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :organization
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:admin, :staff, :brunsfield, :sandbox]

  validates :email,
    presence: { message: "Your email is required." },
    uniqueness:{message: "Your email is already in use."}

    validates :first_name,
      presence: {message: "Your first name is required."}

    validates :last_name,
      presence: {message: "Your last name is required."}

  validates :password,
    presence: {message: "Please provide a password."}



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
