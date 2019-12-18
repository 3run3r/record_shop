require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/label')
also_reload('./models/*')

get '/albums/?' do
  @labels = Label.all()
  if params[:label_id]
    @label = Label.find(params[:label_id].to_i)
    @albums = Label.albums(@label.id)
  else
    @albums = Album.all()
  end
  erb( :"albums/index" )
end

get '/albums/new' do
  @artists = Artist.all()
  @labels = Label.all()
  erb( :"albums/new" )
end

get '/albums/:id/edit' do
  @artists = Artist.all()
  @labels = Label.all()
  @album = Album.find(params[:id])
  erb( :"albums/edit" )
end

get '/albums/:id' do
  @album = Album.find(params[:id])
  erb( :"albums/show" )
end

post '/albums' do
  album = Album.new(params)
  album.save
  redirect to("/albums")
end

post '/albums/:id' do
  Album.new(params).update
  redirect to("/albums")
end

post '/albums/:id/stock' do
  Album.new(params).update_stock
  redirect to("/albums")
end
