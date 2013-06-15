class SettingsController < ApplicationController
  # GET /settings/1/edit
  def edit
    @setting = $settings
  end

  # PUT /settings/1
  # PUT /settings/1.json
  def update
    params[:setting].delete :smtp_password if params[:setting][:smtp_password].blank?
    respond_to do |format|
      if $settings.update_attributes(params[:setting])
        MailConfigurator.new.configure_mailer
        format.html { redirect_to edit_setting_path($settings), notice: 'Settings were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: $settings.errors, status: :unprocessable_entity }
      end
    end
  end
end
