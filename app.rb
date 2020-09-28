require './environment'

module FormsLab
  class App < Sinatra::Base
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end
    
    post '/pirates' do 
      pirate = params[:pirate]
      @pirate = Pirate.new(pirate[:name], pirate[:weight], pirate[:height])
      params[:pirate][:ships].each do |ship| 
        # binding.pry
        Ship.new(ship)   #ship[:name], ship[:type], ship[:booty])}
      end
      @ships = Ship.all
      # binding.pry
      erb :'pirates/show'
    end
  end
end
