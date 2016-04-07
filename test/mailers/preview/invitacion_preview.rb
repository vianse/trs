class ExampleMailerPreview < ActionMailer::Preview
  def invitacion_preview
   Mailer.invitacion(User.first)
  end
end