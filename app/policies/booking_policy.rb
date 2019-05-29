class BookingPolicy < ApplicationPolicy

  def index?
    true
  end

  def works?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
