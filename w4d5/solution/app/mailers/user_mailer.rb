class UserMailer < ApplicationMailer
  default from: 'cat_manage@99cats.com'

  def welcome_email(user)
    @user = user
    @url = 'http://http://localhost:3000/users/new'

    mail(to: 'adrianjewell91@gmail.com', subject: "TEST")
  end
end
