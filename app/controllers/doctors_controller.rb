class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all.order({ :created_at => :desc })

    render({ :template => "doctors/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @doctor = Doctor.where({:id => the_id }).at(0)

    render({ :template => "doctors/show.html.erb" })
  end

  def create
    @doctor = Doctor.new
    @doctor.name = params.fetch("name_from_query")
    @doctor.speciality = params.fetch("speciality_from_query")
    @doctor.rating = params.fetch("rating_from_query")

    if @doctor.valid?
      @doctor.save
      redirect_to("/doctors", { :notice => "Doctor created successfully." })
    else
      redirect_to("/doctors", { :notice => "Doctor failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @doctor = Doctor.where({ :id => the_id }).at(0)

    @doctor.name = params.fetch("name_from_query")
    @doctor.speciality = params.fetch("speciality_from_query")
    @doctor.rating = params.fetch("rating_from_query")

    if @doctor.valid?
      @doctor.save
      redirect_to("/doctors/#{@doctor.id}", { :notice => "Doctor updated successfully."} )
    else
      redirect_to("/doctors/#{@doctor.id}", { :alert => "Doctor failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @doctor = Doctor.where({ :id => the_id }).at(0)

    @doctor.destroy

    redirect_to("/doctors", { :notice => "Doctor deleted successfully."} )
  end
end
