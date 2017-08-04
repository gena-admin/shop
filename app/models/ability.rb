class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    case user.role
      when 'guest'
        can :read, :all
      when 'user'
        can :read, :all
      when 'admin'
        can :manage, :all
      else
        can :read, :all
    end
  end
end
