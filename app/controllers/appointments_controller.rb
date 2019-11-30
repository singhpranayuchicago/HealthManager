class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all.order({ :created_at => :desc })

    render({ :template => "appointments/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @appointment = Appointment.where({:id => the_id }).at(0)

    render({ :template => "appointments/show.html.erb" })
  end

  def create
    @appointment = Appointment.new
    @appointment.description = params.fetch("description_from_query")
    @appointment.time_at = params.fetch("time_at_from_query")
    @appointment.user_id = session[:user_id]
    @appointment.message_sent = false
    string = params.fetch("doctor_id_from_query")
    @appointment.doctor_id = Doctor.where(name: string).pluck(:id).first 

    if @appointment.valid?
      @appointment.save
      redirect_to("/appointments", { :notice => "Appointment created successfully." })
    else
      redirect_to("/appointments", { :notice => "Appointment failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @appointment = Appointment.where({ :id => the_id }).at(0)

    @appointment.description = params.fetch("description_from_query")
    @appointment.time_at = params.fetch("time_at_from_query")
    @appointment.user_id = session[:user_id]
    @appointment.message_sent = false
    string = params.fetch("doctor_id_from_query")
    @appointment.doctor_id = Doctor.where(name: string).pluck(:id).first 

    if @appointment.valid?
      @appointment.save
      redirect_to("/appointments/#{@appointment.id}", { :notice => "Appointment updated successfully."} )
    else
      redirect_to("/appointments/#{@appointment.id}", { :alert => "Appointment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @appointment = Appointment.where({ :id => the_id }).at(0)

    @appointment.destroy

    redirect_to("/appointments", { :notice => "Appointment deleted successfully."} )
  end
end
