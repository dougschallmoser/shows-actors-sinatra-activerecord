require './config/environment'

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
        erb :new
    end

    post '/shows' do 
        show = Show.new(title: params[:show][:title], category: params[:show][:category])
        
        params[:show][:actors].each do |actor_details|
            actor = Actor.new(actor_details)
            actor.show = show 
            actor.save
        end 

        redirect "/shows/#{show.id}"
    end

    get '/shows/:id' do 
        @show = Show.find(params[:id])
        erb :show 
    end

    get '/shows/:id/edit' do
        @show = Show.find(params[:id])
        erb :edit
    end

    patch '/shows/:id' do 
        show = Show.find(params[:id])
        show.update(title: params[:show][:title], category: params[:show][:category])

        params[:show][:actors].each do |actor_details|
            show.actors.update(actor_details)
        end 
        redirect "/shows/#{show.id}"
    end 

    get '/shows/:id/delete' do
        Show.find(params[:id]).destroy
        redirect "/shows"
    end 

end 