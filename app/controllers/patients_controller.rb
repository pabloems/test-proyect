class PatientsController < ApplicationController

  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  # before_action :patient_params , only: [:create, :update]

  def index
    @patients = Patient.all
  end

  def show
    # patient seteado en el before_action
  end
  
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.complete_name.capitalize
    if @patient.save
      redirect_to patients_path
    else
      flash[:alert] = "El paciente no se creó correctamente"
      render :new
    end
  end

  def edit
    # patient seteado en el before_action
  end

  def update
    @patient.update(patient_params)
    redirect_to patients_path
    flash[:alert] = "El paciente se actualizó correctamente"
  end

  def destroy
    @patient.destroy
      redirect_to root_path
      flash[:notice] = "El paciente se eliminó correctamente"
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :last_name, :phone)
  end

end
