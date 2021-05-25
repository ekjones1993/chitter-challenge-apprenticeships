require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require_relative './database_connection_setup.rb'
require 'uri'
require 'sinatra/flash'
require 'date'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @peeps = Peep.all
    erb :'/home'
  end

  get '/peep' do
    erb :peep
  end

  post '/peep' do
    Peep.create(message: params['message'], date: Time.now.strftime("%d/%m/%Y %H:%M"))
    redirect '/home'
  end

  post '/search' do
    @searched = Peep.search(keyword: params['keyword'])
    @keyword = params[:keyword]
    erb :search
  end

  run! if app_file == $0
end
