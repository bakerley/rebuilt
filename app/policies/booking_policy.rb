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

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
