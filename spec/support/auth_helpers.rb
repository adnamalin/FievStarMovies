module AuthHelpers
  def login(user)
    page.set_rack_session(user_id: user.id)
  end

  def logout
    page.set_rack_session(user_id:nil)
  end
end
