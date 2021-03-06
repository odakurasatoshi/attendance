# frozen_string_literal: true

class Teachers::SessionsController < Devise::SessionsController
  # ログイン後に遷移するpathを設定
  def after_sign_in_path_for(resource)
    teachers_attendees_path
  end

  # ログアウト後に遷移するpathを設定
  def after_sign_out_path_for(resource)
    new_teacher_session_path
  end

  def new_guest
    teacher = Teacher.guest
    sign_in teacher
    flash[:notice] = "ゲストユーザー(先生)としてログインしました。"
    redirect_to teachers_attendees_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
