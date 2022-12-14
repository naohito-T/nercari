class UserInformationsController < ApplicationController
  # has_oneを宣言すればbuild_アソシエーション名でcurrent_userのidがあらかじめ代入されているUserInformationモデルのインスタンスを生成することができる。
  def new
    @user_information = current_user.build_user_information
  end

  def create
    @user_information = current_user.build_user_information(user_information_params)

    if @user_information.save
      redirect_to :root, notice: "個人情報の登録に成功しました。"
    else
      flash.now.alert = "個人情報の登録に失敗しました。"
      render :new
    end
  end

  private

  # newやcreateのアクションメソッドではないのでprivateにする。
  def user_information_params
    params.require(:user_information).permit(
      :family_name,
      :given_name,
      :family_name_kana,
      :given_nama_kana,
      :birth_date
    )
  end
end
