class Mailer < ActionMailer::Base

  def invitacion(user, consultora)
  	if consultora.nil?
  		@mensaje="Favor de completar tu perfil"
  	else
 
  RestClient.post "https://api:key-e7d79c66e74391fdf48b657624f23ddc"\
  "@api.mailgun.net/v2/sandboxb9c2dadab0ea49f6b7130d1091646c59.mailgun.org/messages",
  :from => "Sistema de Reporte de Actividades <noreply@vianse.mx>",
  :to => user,
  :subject => "No tardes más!! registrate ahora y no te pierdas de las actividades de tus consultores" ,
  :html => "Estimado <strong>" + user + "</strong>, la consultora <strong>" + consultora.nombre +
  "</strong> te ha enviado esta invitación para que te registres y puedas ver las actividades de sus recursos. " +
  "Para registrarse solo da click en la siguiente liga " + "<a href=" + "https://trsreporte.herokuapp.com/users/sign_up?email=" + user + ">Registrar</a>"
  end
  end

end
