class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :picture, AvatarUploader


  validates :name, presence: true, length: { minimum: 2 }
  validates :email,  presence: true
  # validates :email, format: { without: /\^[0-9]/}
  # :presence => {:message => "Your email is used to save your greeting."}, :allow_blank => true,:uniqueness => { :case_sensitive => false } 

  validates_confirmation_of :password
  # validates_format_of :name, :with => /^[A-Za-z0-9 ]*$/ { with: /[a-zA-Z0-9]/}
  validates :name, format: { with: /[a-zA-Z]/}


  validates :name, uniqueness: { case_sensitive: false }
  validates_uniqueness_of :email, :allow_blank => true

  has_many :likes
  has_many :lectures, through: :likes

  has_many :spams
  has_many :lectures, through: :spams

  has_many :comments
  has_many :lectures, through: :comments

  has_many :courses
  has_many :lectures



  validate :age_is_valid



  def age_is_valid
    if birthdate.present? && Date.parse(birthdate) > Date.today
      errors.add(:birthdate, "can't be in the future")
    end

    if birthdate.present? &&  (Date.today.year - Date.parse(birthdate).year) < 10
      errors.add(:birthdate, "you are too young to register")
    end
  end



end

