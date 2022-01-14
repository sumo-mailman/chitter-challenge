require 'sinatra/base'
require 'sinatra/reloader'

class ChitterApp < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end 

  get '/' do 
    'Hello World'
  end 

  get '/peeps' do
    peeps = [
      "Peep 1",
      "Peep 2",
      "Peep 3",
    ]
    peeps.join
  end

  run! if app_file ==$0 
end 
