class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def host_index?
    return true
  end

  # def new?
  #   return true
  # end

  # def create?
  #   return true
  # end
end
