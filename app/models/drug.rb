# == Schema Information
#
# Table name: drugs
#
#  id           :integer          not null, primary key
#  amount       :string
#  description  :string
#  message_sent :boolean
#  rating       :integer
#  take_at      :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

class Drug < ApplicationRecord
  validates(:description, { :presence => true })
  validates(:take_at, { :presence => true })
  validates(:rating, { :presence => true })
  validates(:amount, { :presence => true })

  def drug_users
    user_record = User.where({ :id => self.user_id })
    user_name = user_record.pluck(:email)
    return user_name.at(0)
  end 

end
