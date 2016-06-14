class NotificationsController < ApplicationController
  def create
    next_user = Emptying.next_user( Emptying.last.user.id )
    @notification = Notification.new created_by: current_user, sent_to: next_user
    Notification.notify next_user, "This is a reminder that it's your turn to empty the dishes!" 
    redirect_to emptyings_path if @notification.save
  end
end
