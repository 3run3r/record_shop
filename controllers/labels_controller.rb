require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/label')
also_reload('./models/*')

get'/labels/:id' do
  @label = Label.find(params[:id].to_i)
  erb(:"labels/show")
end
