class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:guest, :user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
  	self.role ||= :guest
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
