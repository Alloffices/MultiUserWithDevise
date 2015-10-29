class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # All posts written by a user. Inverse of Post#author
  has_many :posts, foreign_key: 'author_id'

  # All requests to contribute to posts
  has_many :contribution_requests, -> { where(accepted: false) }, class_name: 'Contribution'
  # All accepted requests to contribute to posts
  has_many :contributions, -> { where(accepted: true) }

  # All posts the user can contribute to
  has_many :contributed_posts, through: :contributions, source: :post

  has_many :posts do

    def today
      where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
    end

    def this_week
      where(:created_at => (Time.zone.now.beginning_of_week..Time.zone.now))
    end

  end

  has_many :comments

  after_create :send_notification

  def send_notification
  	AdminMailer.new_user(self).deliver
  end

end
