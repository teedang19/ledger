class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
    else
      can :manage, Account, user_id: user.id
    end
  end

end
