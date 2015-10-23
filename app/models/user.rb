class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts do

    def today
      where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
    end

    def this_week
      where(:created_at => (Time.zone.now.beginning_of_week..Time.zone.now))
    end

  end

  has_many :comments

  #Join table associations
  has_many :post_groups
  has_many :post_members, class_name: "Post", source: :post, through: :post_groups

  after_create :send_notification

  def send_notification
  	AdminMailer.new_user(self).deliver
  end

end
