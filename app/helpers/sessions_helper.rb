module SessionsHelper
  def log_in(user) # à appeler à la page login mais aussi juste après la création d'un nouvel utilisateur (par exemple).
    session[:user_id] = user.id
  end

  def current_user # retourner l'instance de User contenant les infos de ton utilisateur connecté
    User.find_by(id: session[:user_id])
  end

  def logged_in? #https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8  
    !current_user.nil? # autre solution >>> session[:user_id]
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
