class AppointmentsController < ApplicationController

  before_action :set_appointment, only: [ :show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def quote
    @appointments = Appointment.where(date: Date.today)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointments_params)
    @appointment.user_id = current_user.id
    if @appointment.save
      redirect_to root_path
      flash[:alert] = "Se agendó su cita correctamente"
    else
      flash[:alert] = "Hubo un error al agendar su cita"
      render :new
    end
  end


  def edit
  end

  def update
    @appointment = @appointment.user_id.find(params[:id])
    @appointment.update(appointments_params)
    @appointments = current_user.appointment

    if @appointments.save
      redirect_to appoinments_path
      flash[:notice] = "La cita se actualizó correctamente"
    end
  end

  def destroy
    @appointment.destroy
  end


  private

  def set_user
    @user = current_user
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointments_params
    params.require(:appointment).permit(:date, :time, :user_id, :patient_id)
  end

end
