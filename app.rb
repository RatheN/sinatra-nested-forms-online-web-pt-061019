require './environment'

module FormsLab
  class App < Sinatra::Base

    get('/') {erb :root}
    get('/new') {erb :'pirates/new'}
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all
      erb :'pirates/show'
    end
  end
end
