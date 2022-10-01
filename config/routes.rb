# frozen_string_literal: true

Rails.application.routes.draw do
  # app/controlllers/usersにmapping
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/password',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks'
  }
  
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'

  # 本人情報登録のモデルはUserInformationで、ユーザーひとりにつき１つだけなの で、resource で (resources ではありません)routing を定義します。resources :use r_informations で定義すると user_informations/1 のような id を params でとる URL が生成されます。本人情報登録の場合はログイン中のユーザーが判定できればよい。URLにidは不要です。
  resource :user_information # お互いに単数にする。

  # mail confirm
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
