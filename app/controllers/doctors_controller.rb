class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  
  def index
    @doctors = Doctor.all 
  end

  def show
  end

  def new
    @doctor = Doctor.new 
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      flash[:success] = 'Doctor Created'
      redirect_to @doctor
    else 
      render :new 
    end 
  end 

  def edit
  end

  def update 
    if @doctor.update(doctor_params)
      flash[:success] = 'Doctor Updated.'
      redirect_to @doctor
   else 
     render :edit 
    end 
  end 

  def destroy
    @doctor.destroy
    flash[:success] = 'Doctor Deleted'
    redirect_to :root
  end 

private 
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :hospital)
  end 

end
