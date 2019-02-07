# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  def show?
    record.user_id == user.id
  end
end
