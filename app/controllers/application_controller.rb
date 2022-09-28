class ApplicationController < ActionController::Base
  
  include SessionsHelper #全てのコントローラーでSessionsHelperMethodを利用可能にする
end
