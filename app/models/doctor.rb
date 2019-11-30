# == Schema Information
#
# Table name: doctors
#
#  id         :integer          not null, primary key
#  name       :string
#  rating     :integer
#  speciality :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Doctor < ApplicationRecord

  validates(:name, { :presence => true })
  validates(:speciality, { :presence => true })
  validates(:rating, { :presence => true })
  validates :name, :uniqueness => { :case_sensitive => false }

  def patients
    appointment_ids = Appointment.where({ :user_id => self.id })
    array = appointment_ids.pluck(:user_id)
    return User.where({:id => array })
  end 

  def patient_appointments 
    return Appointment.where({:doctor_id => self.id })
  end 

end
