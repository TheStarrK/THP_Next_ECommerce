# frozen_string_literal: true

# == Schema Information
#
# Table name: profils
#
#  id           :bigint(8)        not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Profil, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
