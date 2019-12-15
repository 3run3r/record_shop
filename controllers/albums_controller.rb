require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/label')
also_reload('./models/*')

get '/albums' do
  @albums = Album.all()
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

post '/albums' do
  album = Album.new(params)
  album.save
  redirect to("/albums")
end

post '/albums/:id' do
  Album.new( params ).update
  redirect to '/albums'
end
