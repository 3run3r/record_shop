require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/label')

require('pry')

label1 = Label.new({"name" => "Roadrunner Records"})
label1.save()

artist1 = Artist.new({"name" => "Porcupine Tree", "label_id" => label1.id})
artist1.save()

album1 = Album.new(
  {"title" => "Fear Of A Blank Planet",
   "genre" => "Progressive Rock",
   "stock_quantity" => 10,
   "buying_cost" => 7.50,
   "selling_price" => 10.50,
   "artist_id" => artist1.id
  }
)
album1.save()
