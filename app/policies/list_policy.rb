class ListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def destroy?
    if user == record.user
      true
    elsif user.admin?
      true
    else
      false
    end
  end
end
