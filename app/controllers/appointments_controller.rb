class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  
  def show
  end 
  
  def new
    @doctors = Doctor.all.map{ |d| [d.name, d.id] }
    @patients = Patient.all.map{ |p| [p.full_name, p.id] }
    @appointment = Appointment.new 
  end

  def create 
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = 'Appointment Created'
      redirect_to :back
    else 
      render :new 
    end 
  end 

  def edit 
  end

  def update 
    if @appointment.update(appointment_params)
      flash[:success] = 'Appointment Updated.'
      redirect_to :back
    else 
      render :edit 
    end 
  end 

  def destroy
    @appointment.destroy
    flash[:success] = 'Appointment Deleted!'
    redirect_to :back
  end 

private 
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end 

  def appointment_params
    params.require(:appointment).permit(
      :doctor_id, :patient_id, :date, :time, :location)
  end 
  

end
