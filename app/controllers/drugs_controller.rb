class DrugsController < ApplicationController
  def index
    @drugs = Drug.all.order({ :created_at => :desc })

    render({ :template => "drugs/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @drug = Drug.where({:id => the_id }).at(0)

    render({ :template => "drugs/show.html.erb" })
  end

  def create
    @drug = Drug.new
    @drug.description = params.fetch("description_from_query")
    @drug.user_id = session[:user_id]
    @drug.message_sent = false
    @drug.take_at = params.fetch("take_at_from_query")
    @drug.rating = params.fetch("rating_from_query")
    @drug.amount = params.fetch("amount_query")

    if @drug.valid?
      @drug.save
      redirect_to("/drugs", { :notice => "Drug created successfully." })
    else
      redirect_to("/drugs", { :notice => "Drug failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @drug = Drug.where({ :id => the_id }).at(0)

    @drug.description = params.fetch("description_from_query")
    @drug.user_id = session[:user_id]
    @drug.message_sent = false
    @drug.take_at = params.fetch("take_at_from_query")
    @drug.rating = params.fetch("rating_from_query")
    @drug.amount = params.fetch("amount_to_take_query")

    if @drug.valid?
      @drug.save
      redirect_to("/drugs/#{@drug.id}", { :notice => "Drug updated successfully."} )
    else
      redirect_to("/drugs/#{@drug.id}", { :alert => "Drug failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @drug = Drug.where({ :id => the_id }).at(0)

    @drug.destroy

    redirect_to("/drugs", { :notice => "Drug deleted successfully."} )
  end
end
