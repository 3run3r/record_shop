require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/label')
also_reload('./models/*')

get '/albums' do
  @albums = Album.all()
  erb( :"albums/show" )
end
