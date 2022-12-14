class User < ApplicationRecord
  devise :database_authenticatable, # 認証
         :registerable, # 新規登録
         :recoverable, # パスワードリセット
         :rememberable, # ログイン状態を保持
         :validatable, # バリデーション
         :confirmable, # メールアドレス認証
         :lockable, # パスワード複数間違いでアカウントロック
         :timeoutable, # ログイン保持機能
         :trackable # ログイン時のipなどを記録

  # `class: "menu" は :class => "menu"`と同義
  # 一行ずつも可能
  # validates :nickname, presence: true
  # validates :gender, presence :true
  # with_optionsだとまとめられる、
  with_options presence: true do
    validates :nickname
    validates :gender
    before_validation :skip_confirmation!, if: :new_record?
  end
  
  # ユーザひとリあたり本人情報は1つだけ必要。has_oneアソシエーションをUserモデルに定義する。
  # また User モデルのインスタンスが削除された場合は UserInformation も不要になるため dependent: :destroy オプションも付与します。
  has_one :user_information, dependent: :destroy
  
  # enumはhashで定義しkeyで使用しvalueをinsertする
  # enumを追加すると自動でメソッドが追加される。
  enum gender: {
    unanswered: 0,
    # 男性
    male: 1,
    # 女性
    female: 2
  }

  class << self
    def genders_i18n
      I18n.t("enums.user.gender")
    end
  end
end 
