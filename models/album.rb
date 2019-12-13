require_relative('../db/sql_runner')

class Album

  attr_reader(:id, :artist_id)
  attr_accessor(:title, :genre, :stock_quantity, :selling_price, :buying_cost)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @stock_quantity = options['stock_quantity'].to_i
    @buying_cost = options['buying_cost'].to_f
    @selling_price = options['stock_quantity'].to_f
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    ( title,
      genre,
      stock_quantity,
      buying_cost,
      selling_price,
      artist_id
    ) VALUES (
      $1, $2, $3, $4, $5, $6
    ) RETURNING id;"
    values = [@title, @genre, @stock_quantity, @buying_cost, @selling_price, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


end
