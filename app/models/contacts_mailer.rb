class ContactsMailer < ActionMailer::Base
  default from: %("#{name}" <#{email}>)

  def general_message(contact)
    @contact = contact
    mail( :to => "luisbravo258@gmail.com", :subject => "You Have a Message From Your Website")
  end
end
