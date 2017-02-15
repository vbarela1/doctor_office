class PatientsController < ApplicationController
  before_action :set_patient, only:[:show, :edit, :update, :destroy]
  
  def index
    @patients = Patient.all
  end 

  def show 
    @appointments = @patient.appointments 
  end 

  def new
    @patient = Patient.new 
  end

  def create
    @patient = Patient.new(patient_params)
    flash[:success] = 'Patient Created'
    if @patient.save
      redirect_to patients_path
    else 
      render :new 
    end 
  end 

  def edit 
  end

  def update 
    if @patient.update(patient_params)
      flash[:success] = 'Patient Updated.'
      redirect_to patients_path
    else 
      render :edit 
    end 
  end 

  def destroy  
    @patient.destroy 
    flash[:success] = 'Patient Information Deleted'
      redirect_to patients_path
  end 

  private 
    def set_patient
      @patient = Patient.find(params[:id])
    end 

    def patient_params 
      params.require(:patient).permit(:first_name, :last_name, :age, :gender)
    end 


end
