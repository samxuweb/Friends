class User < ActiveRecord::Base

  MAN = 'Man'
  LADY = 'Lady'

  def sex?
    return MAN if self.sex == true
    return LADY if self.sex == false
  end

end
