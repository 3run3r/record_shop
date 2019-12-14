require_relative('../db/sql_runner')

class Artist

  attr_reader(:id, :label_id)
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

end