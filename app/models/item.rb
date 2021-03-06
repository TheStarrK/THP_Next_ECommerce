# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_one_attached :image

  validates :name, :description, :price, presence: true
  validates :name, length: { in: 2..40 }
  validates :description, length: { in: 2..400 }
end
