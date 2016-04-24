class NotifyMailer < ApplicationMailer
default from: "from@example.com

def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Critical Notification')
  end"
end
