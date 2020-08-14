class Application < Sinatra::Base

    set :views, "app/views"

    get '/' do
        redirect '/shows'
    end

    get '/shows' do 
        @shows = Show.all
        erb :index
    end

    get '/shows/new' do
    end

    get '/shows/:id' do 
        @show = Show.find(params[:id])
        erb :show 
    end

end 