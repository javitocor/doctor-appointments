class RolesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /roles
  def index
    @roles = Role.all
  end

  # GET /roles/1
  def show
    if @role.users.empty?
      @assosciated_user = 'None'
    else
      @assosciated_users = @role.users.map(&:name).join(', ')
    end
  end

  # GET /roles/new
  def new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  def create

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: "Role was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: "Role was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: "Role was successfully deleted." }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def role_params
      params.require(:role).permit(:name)
    end
end
