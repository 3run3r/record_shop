require_relative('../db/sql_runner')

class Label

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO labels
    ( name ) VALUES ( $1 )
    RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM labels;"
    results = SqlRunner.run(sql)
    return results.map {|label| Label.new(label)}
  end

  def update()
    sql = "UPDATE labels SET name = $1 WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE from labels;"
    SqlRunner.run(sql)
  end

  def artists()
    sql = "SELECT artists.* FROM artists
    INNER JOIN albums ON albums.artist_id = artists.id
    WHERE albums.label_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|artist| Artist.new(artist)}
  end

end
