# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  def own_drugs 
    return Drug.where({ :user_id => self.id })
  end 

  def own_doctors 
    appointment_ids = Appointment.where({ :user_id => self.id })
    array = appointment_ids.pluck(:doctor_id)
    return Doctor.where({:id => array })
  end 

  def own_appointments 
    return Appointment.where({ :user_id => self.id })
  end 
  
end
