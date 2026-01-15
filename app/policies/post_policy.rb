class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.present? && (user.author? || user.admin?)
  end

  def create?
    new?
  end

  def edit?
    user.present? && (record.user == user || user.admin?)
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  # Policy Scope
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.author?
        scope.where(user_id: user.id).or(scope.published)
      else
        scope.published
      end
    end
  end
end
