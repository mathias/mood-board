class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  extend FriendlyId
  friendly_id :full_name, use: [:slugged]

  has_many :moods, inverse_of: :user, dependent: :delete_all

  validates :email, format: { with: /\A[a-zA-Z\d._-]+@heroku.com\z/,
                              message: 'Email must be a valid @heroku.com email address.'}

  has_one :latest_mood, class_name: Mood

  def image_url
    Gravatar.new(email).image_url
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_first_mood
    self.moods.create(top: 360, left: 492)
  end
end
