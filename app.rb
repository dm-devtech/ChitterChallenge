require 'sinatra/base'
require './lib/Peep'
require './lib/User'

class ChitterManager < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    @users = User.all
    erb :'/peeps_index'
  end

  get '/peeps/new' do
    erb :'/create_peep'
  end

  get '/signup' do
    erb :'/signup'
  end

  post '/signup' do
    User.create(username: params[:username], name: params[:name], password: params[:password], email: params[:email])
    redirect '/peeps'
  end

  post '/peeps' do
    Peep.create(peep_text: params[:peep_text], time: params[:time] )
    redirect '/peeps'
  end

  run! if app_file == $0
end
