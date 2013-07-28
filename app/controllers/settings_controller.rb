class SettingsController < ApplicationController
  before_filter :authenticate_user!

  # GET /settings/1/edit
  def edit
    @setting = $settings
  end

  # PUT /settings/1
  # PUT /settings/1.json
  def update
    params[:setting].delete :smtp_password if params[:setting][:smtp_password].blank?

    @setting = Setting.first
    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        $settings=@setting
        MailConfigurator.new.configure_mailer
        format.html { redirect_to edit_setting_path(@setting), notice: 'Settings were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end
end
