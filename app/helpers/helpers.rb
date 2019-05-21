class Helpers #create a model in case I want to use the methods in my views, similar to a Learn.co Lab for Flatiron FlatBank

  def self.current_user(session_hash)
    user = User.find_by(id: session_hash[:user_id])
    return user if user
  end

  def self.is_logged_in?(session_hash)
    !!current_user(session_hash)
  end 
end
