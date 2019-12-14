require_relative('../db/sql_runner')

class Album

  attr_reader(:id)
  attr_accessor(:title, :genre, :stock_quantity, :selling_price, :buying_cost, :artist_id, :label_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @stock_quantity = options['stock_quantity'].to_i
    @buying_cost = options['buying_cost'].to_f
    @selling_price = options['selling_price'].to_f
    @artist_id = options['artist_id'].to_i
    @label_id = options['label_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    ( title,
      genre,
      stock_quantity,
      buying_cost,
      selling_price,
      artist_id,
      label_id
    ) VALUES (
      $1, $2, $3, $4, $5, $6, $7
    ) RETURNING id;"
    values = [@title, @genre, @stock_quantity, @buying_cost, @selling_price, @artist_id, @label_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    results = SqlRunner.run(sql)
    return results.map {|album| Album.new(album)}
  end

  def update()
    sql = "UPDATE albums SET
    (title,
     genre,
     stock_quantity,
     buying_cost,
     selling_price,
     artist_id,
     label_id) =
     ($1, $2, $3, $4, $5, $6, $7)
     WHERE id = $8"
     values = [@title, @genre, @stock_quantity, @buying_cost, @selling_price, @artist_id, @label_id, @id]
     SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE from albums;"
    SqlRunner.run(sql)
  end


end
