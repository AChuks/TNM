class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    alias_action :update, :destroy, :to => :modify
    can [:create, :read, :watch, :submit], Video

    if user.nil?
        p 'User is not logged in'
        cannot :manage, [Youtube, User]
    end
    if user && user.super_admin
        p 'User is a super admin'
        can :manage, :all
    end

    if user && !user.super_admin
        p 'User is not a super admin'
        can :read, [Youtube, User]
        cannot [:create, :modify], [Youtube, User]
    end
  end
end
