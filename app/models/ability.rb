class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    case user.role
      when 'guest'
        can :read, :all
      when 'customer'
        can :read, :all
        can :manage, Cart
      when 'admin'
        can :manage, :all
      else
        can :read, :all
    end
  end
end
