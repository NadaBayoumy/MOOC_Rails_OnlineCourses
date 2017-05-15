class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, ActiveAdmin::Page, :name => "Dashboard"
    can :manage , User
    can :manage , Course
    can :manage , Lecture
    can :manage , AdminUser
    
     # Handle the case where we don't have a current_user i.e. the user is a guest
    # user ||= User.new

    # # Define a few sample abilities
    # can    :manage , Article
    # cannot :manage , Comment
    # can    :read   , Tag , released: true


    # # Define abilities for the passed in user here. For example:
    # #
    #   user ||= User.new # guest user (not logged in)

    #   puts user
    #   # if user.admin?
    #   can :create, :course
      # else
        # can :read, :all
      # end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end




# class Ability
#   include CanCan::Ability

#   def initialize(user)

#       user ||= User.new # guest users
#       send(user.role.name)

#         if user.role.blank?
#           can :read, User #for guest without roles
#         end

#   end

#   def man
#     can :manage, Photo
#   end


#   def boy
#     can :read, Photo
#   end

#   def kid
#     can :read, Article
#   end

# end