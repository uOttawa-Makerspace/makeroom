class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :organization
  has_many :bookings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:saml]
  enum role: [:admin, :staff, :brunsfield, :sandbox]

  validates :email,
            presence: { message: 'Your email is required.' },
            uniqueness: { message: 'Your email is already in use.' }

  validates :first_name,
            presence: { message: 'Your first name is required.' }

  validates :last_name,
            presence: { message: 'Your last name is required.' }

  validates :username,
            presence: { message: 'Username is required.' },
            uniqueness: { message: 'Username is already taken.' }

  validates :password, unless: :skip_password_validation,
            presence: { message: 'Please provide a password.' },
            confirmation: { message: 'Your passwords do not match.' }

  attr_accessor :skip_password_validation

  def set_default_role
    self.role ||= :staff
  end

  def set_role(new_role)
    self.role = new_role
  end

  def get_full_name
    self.first_name + ' ' + last_name
  end

  def admin?
    self.role.eql?('admin')
  end

  def self.from_omniauth(auth)

    info = auth.extra.raw_info.attributes

    if where(provider: auth.provider, uid: auth.uid).present?
      where(provider: auth.provider, uid: auth.uid).first
    elsif where(email: info['email_address'].join).present?
      user = find_by!(email: info['email_address'].join)
      user.skip_password_validation = true
      user.update!(provider: auth.provider, uid: auth.uid)
    else
      create! do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = info['email_address'].join
        user.username = info['username'].join
        user.organization_id = Organization.first.id
        user.password = Devise.friendly_token[0, 20]
        user.first_name = info['name'].join.split(' ', 2)[0]
        user.last_name = info['name'].join.split(' ', 2)[1]
      end

      @created_user = User.last

      puts(info['is_admin'])
      puts(info['is_admin'].join == 'true')
      puts(info['is_staff'])
      puts(info['is_staff'].join == 'true')

      if info['is_admin'].join == 'true'
        @created_user = User.last
        @created_user.set_role('admin')
        @created_user.skip_password_validation = true
        @created_user.save!
      elsif info['is_staff'].join == 'true'
        @created_user = User.last
        @created_user.set_role('staff')
        @created_user.skip_password_validation = true
        @created_user.save!
      end

      @created_user
    end
  end
end

