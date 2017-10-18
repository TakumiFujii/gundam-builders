module UsersHelper
  def boss
    current_user == User.find(1)
  end
end
