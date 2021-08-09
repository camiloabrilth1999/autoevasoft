class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  
  def send_mail
    #No hace nada porque es una prueba
  end
end
