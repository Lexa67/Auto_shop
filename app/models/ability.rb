# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.seller?
      can :read, Car
      can :read, Auto
      can :create, Car
      can :update, Car do |car|
        car.try(:user) == user
      end
      can :destroy, Car do |car|
        car.try(:user) == user
      end
      can :read, Comment
      can :create, Comment
      can :update, Comment do |comment|
        comment.try(:user) == user
      end
      can :destroy, Comment do |comment|
        comment.try(:user) == user
      end
      can :read, Reply
      can :create, Reply
      can :update, Reply do |reply|
        reply.try(:user) == user
      end
      can :destroy, Reply do |reply|
        reply.try(:user) == user
      end
    elsif user.regular?
      can :read, Car
      can :read, Auto
      can :read, Comment
      can :create, Comment
      can :update, Comment do |comment|
        comment.try(:user) == user
      end
      can :destroy, Comment do |comment|
        comment.try(:user) == user
      end
      can :read, Reply
      can :create, Reply
      can :update, Reply do |reply|
        reply.try(:user) == user
      end
      can :destroy, Reply do |reply|
        reply.try(:user) == user
      end
    end
  end
end
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

