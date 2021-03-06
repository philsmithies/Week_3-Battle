require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:p1_name])
    player2 = Player.new(params[:p2_name])
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do 
    @game = $game
    erb :attack
  end

  run! if app_file == $0
end