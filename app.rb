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
      pirate = Pirate.create(name: params[:pirate][:name], height: params[:pirate][:height], weight: params[:pirate][:weight])
      
       params[:pirate][:ships].each do |ship_data| 
         ship = Ship.new(ship_data)
         ship.pirate = pirate
         ship.save
       end 
      
      redirect to "/pirates/#{pirate.id}"
    end 
    #   pirate = params[:pirate]
    #   @pirate = Pirate.new(pirate[:name], pirate[:weight], pirate[:height])
    #   params[:pirate][:ships].each do |ship| 
        
    #     Ship.new(ship) 
    #   end
      
    #   @ships = Ship.all
     
    #   erb :'pirates/show'
    # end
  end
end 
