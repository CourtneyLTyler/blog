class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'courtneytyler7@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  def order_confirmation(user, product)
    @product = product
    @appname = "Unicourt's Furnishings"
    mail(to: user.email, subject: "Order confirmation from the #{@appname} online store")
  end

end
