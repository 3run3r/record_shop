require_relative('../db/sql_runner')

class Artist

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists
    ( name
    ) VALUES (
      $1
    ) RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    results = SqlRunner.run(sql)
    return results.map {|artist| Artist.new(artist)}
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE from artists;"
    SqlRunner.run(sql)
  end

  def labels()
    sql = "SELECT labels.* FROM labels
    INNER JOIN albums ON albums.label_id = labels.id
    WHERE albums.artist_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|label| Label.new(label)}
  end


  def self.find( id )
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Artist.new( results.first )
  end

  def albums()
    sql = "SELECT albums.* FROM albums
    WHERE albums.artist_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|album| Album.new(album)}
  end

end
