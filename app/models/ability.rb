# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.patient?
      cannot :read, Role
      can :index, User
      can :show, User do |user|
        user.role_id == 1
      end
      can :read, Appointment
      can :create, Appointment
      can :update, Appointment do |appointment|
        appointment.try(:user) == user
      end
      can :destroy, Appointment do |appointment|
        appointment.try(:user) == user
      end
    elsif user.doctor?
      cannot :read, Role
      can :index, User
      can :show, User do |user|
        user.role_id == 1 || user.role_id == 2
      end
      can :read, Appointment
      can :destroy, Appointment do |appointment|
        appointment.try(:user) == user
      end
    end
  end
end