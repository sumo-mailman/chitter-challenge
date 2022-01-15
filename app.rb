require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class ChitterApp < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader
    also_reload 'lib/peep.rb'
  end

  enable :sessions

  #this is home page where users sign up 
  get '/' do 
    erb :'index'
  end

  #post request to sign up 
  post '/sign_up' do 
    session[:user_id] = params[:user_id]
    redirect '/peeps'
  end

  #main page directory?  
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end 

  post '/peeps/create' do
    connection = PG.connect(dbname: 'peep_manager')
    message = params[:message]
    user_id = session[:user_id]
    connection.exec("INSERT INTO peeps(message, user_id) VALUES ('#{message}', '#{user_id}');")
    redirect '/peeps'
  end 

  run! if app_file == $0 
end 
