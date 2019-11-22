class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  
  def email_teste(email)
    @email = email
    mail(to: @email, subject: "Teste de email Argo")
  end
end
