# == Schema Information
#
# Table name: appointments
#
#  id           :integer          not null, primary key
#  description  :string
#  message_sent :boolean
#  time_at      :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  doctor_id    :integer
#  user_id      :integer
#

class Appointment < ApplicationRecord
  #joint table 
  validates(:doctor_names, { :presence => true })
  validates(:description, { :presence => true })
  validates(:time_at, { :presence => true })
  
  def doctor_names
    appointment_ids = Doctor.where({ :id => self.doctor_id })
    return appointment_ids.pluck(:name).at(0)
  end 

  def doctors 
    return Doctor.where({ :id => self.doctor_id })
  end 

  def patients 
    user_record = User.where({ :id => self.user_id })
    user_name = user_record.pluck(:email)
    return user_name.at(0)
  end
end
