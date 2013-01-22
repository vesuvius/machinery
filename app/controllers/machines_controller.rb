class MachinesController < ApplicationController
  
  # before_filter :login_required
  before_filter :admin_required, :except => [:index, :show, :toggle_picture]

  def index
    respond_to do |format|
        format.html {
          @header = Machine.column_names.delete_if { |attribute| ['created_at', 'updated_at', 'id'].include?(attribute) }
        }
        format.json { render json: MachinesDatatable.new(view_context) }
    end
  end

  def new
    @machine = Machine.new
  end
  
  def edit
    @machine = Machine.find(params[:id])
    render :new
  end

  def show
    @machine = Machine.find(params[:id])
    @pictures = @machine.pictures
  end
  
  def create
    @machine = Machine.new params[:machine]
    if @machine.save 
      redirect_to machines_path
    else
      render :new
    end
  end
  
  def update
    @machine = Machine.find(params[:id])
    if @machine.update_attributes params[:machine]
      redirect_to machines_path
    else
      render :new
    end
  end
  
  def create_picture
    @picture = Machine.find(params[:machine_id]).pictures.create params[:picture]
  end
  
  def remove_picture
    Picture.find(params[:picture_id]).destroy
    redirect_to :back, notice: (t 'picture_removed')
  end

#  AJAX Section Starts Here

  def toggle_picture
    @picture = Picture.find(params[:picture_id])
    respond_to do |format|
      format.html
      format.js
    end
  end
    
end
