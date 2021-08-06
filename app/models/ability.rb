# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.patient?
      can :read, User
      can :read, Appointment
      can :create, Appointment
      can :update, Appointment do |appointment|
        appointment.try(:user) == user
      end
      can :destroy, Appointment do |appointment|
        appointment.try(:user) == user
      end
    elsif user.doctor?
      can :read, User
      can :read, Appointment
      can :destroy, Appointment do |appointment|
        appointment.try(:user) == user
      end
    end
  end
end