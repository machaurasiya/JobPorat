# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.admin?
      can :manage, :all  
    elsif user.employer?
      can :manage, Post

      # can :create, Post  
      # can :update, Post, user_id: user.id 
      # can :destroy, Post, user_id: user.id 
    elsif user.job_seeker?
      can :read, Post  
    end
  end
end
