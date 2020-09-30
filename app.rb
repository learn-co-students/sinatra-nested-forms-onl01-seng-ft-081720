require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do 
      erb :root
    end

    get '/new' do 
      pirate = Pirate.new(params)
      erb :"pirates/new"

    end

    post '/pirates' do
      # binding.pry
      @pirate_hash = params[:pirate]
      erb :"pirates/show"

    end




  end
end
