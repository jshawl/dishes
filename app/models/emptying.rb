class Emptying < ActiveRecord::Base
  belongs_to :user


  def self.next_user id
    if id == 3
      next_user = 1
    else
      next_user = id + 1 
    end
    User.find( next_user )
  end
end
