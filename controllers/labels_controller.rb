require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/label')
also_reload('./models/*')

get '/labels' do
  @labels = Label.all()
  erb(:"labels/index")
end

get '/labels/new' do
  erb(:"labels/new")
end

get'/labels/:id' do
  @label = Label.find(params[:id].to_i)
  erb(:"labels/show")
end

post '/labels' do
  label = Label.new(params)
  label.save
  redirect to("/labels")
end
