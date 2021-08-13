require "sinatra/base"
require "sinatra/reloader"
require_relative 'models/player'
require_relative 'models/game'

class Battle < Sinatra::Base

  enable :sessions
 
  get '/' do
    erb :index
  end

  post "/names" do
    $player_1 = Player.new(params[:player_1])
    $player_2 = Player.new(params[:player_2])
    redirect "/play"
  end
  
  get "/play" do
    @player_1 = $player_1.name
    @player_2 = $player_2.name
    @player_1_hit_points = $player_1.hp  
    @player_2_hit_points = $player_2.hp 
    erb :play
  end

  get '/attack' do
    @player_1 = $player_1.name
    @player_2 = $player_2.name
    game = Game.new
    game.attack($player_2)
    @player_2_hit_points = $player_2.hp
    erb :attack
  end

   post "/attack" do
    @player_2_hit_points = $player_2_hit_points 
    @player_2_hit_points -= 10
    redirect "/play"
   end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
