class RegistrationsController < Devise::RegistrationsController

  respond_to :js, :html

  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end

  private

  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    elsif params["user"].present?
      user = User.find_by_email(params["user"]["email"])
      if user.present? && user.encrypted_password.blank?
        user.password = @user.password
        user.password_confirmation = @user.password_confirmation
        @user = user
      end
    end
  end

end
