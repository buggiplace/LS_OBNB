class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newbooking.subject
  #
  def newbooking
    @greeting = "Hello love" #similar to a instance variable in a controller
    @booking = params[:booking]
    mail to: "Malou@awesome-ta.org"
  end
end
