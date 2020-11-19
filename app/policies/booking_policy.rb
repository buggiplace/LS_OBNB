class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  # def new?
  #   return true
  # end

  def create?
    return true
  end

  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user && record.booking_start.future?
  end

  def accept?
    record.office.user == user && record.status == 'Pending'
  end
  
  def reject?
    record.office.user == user && record.status == 'Pending'
  end  
end
