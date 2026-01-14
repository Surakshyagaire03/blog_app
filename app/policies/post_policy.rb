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
end
