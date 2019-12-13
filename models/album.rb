require_relative('..db/sql_runner')

class Album

  attr_reader(:id, :artist_id)
  attr_accessor(:title, :genre, :stock_quantity, :selling_price, :buying_cost)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['name']
    @genre = options['genre']
    @stock_quantity = options['stock_quantity'].to_i
    @selling_price = options['stock_quantity'].to_f
    @buying_cost = options['buying_cost'].to_f
    @artist_id = options['artist_id'].to_i
  end



end
