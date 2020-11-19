class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newbooking.subject
  #
  def newbooking
    @greeting = "Hi" #similar to a instance variable in a controller
    @booking = params[:booking]
    mail to: "to@example.org"
  end
end
