class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_secure_password

  MAN = 'Man'
  LADY = 'Lady'

  def sex?
    return MAN if self.sex == true
    return LADY if self.sex == false
  end

end
