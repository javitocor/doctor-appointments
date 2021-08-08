class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /appointments or /appointments.json
  def index
    if current_user.admin?
      @appointments = Appointment.all
    elsif current_user.doctor?
      @appointments = current_user.doctor_user_appointments
    elsif current_user.patient?
      @appointments = current_user.patient_user_appointments
    end
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create    
    @appointment.patient_user_id = current_user.id
    @appointment.end_at = DateTime.parse(params[:appointment][:start_at]) + 1.hour
    
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully cancelled." }
      format.json { head :no_content }
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(
        :subject,
        :start_at,
        :end_at,
        :doctor_user_id,
        :patient_user_id,
        {user_image: []}
      )
    end
end
