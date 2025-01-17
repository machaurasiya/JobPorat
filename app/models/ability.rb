# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.admin?
      can :manage, :all  
    elsif user.employer?
      can :read, JobApplication, post: { user_id: user.id }
      can :update, JobApplication, post: { user_id: user.id }
      can :destroy, JobApplication, post: { user_id: user.id }
      # can :create, JobApplication

      can :create, Post  
      can :read, Post
      can :update, Post, user_id: user.id 
      can :destroy, Post, user_id: user.id
      can :create, Profile  
      can :read, Profile
      can :update, Profile, user_id: user.id
      can :destroy, Profile, user_id: user.id 
    else
      can :read, Post
      can :read, JobApplication, user_id: user.id 
      can :create, JobApplication
      can :read, Profile
      can :create, Profile
      can :destroy, Profile, user_id: user.id 
      can :update, Profile, user_id: user.id 
    end
  end
end
