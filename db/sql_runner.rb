require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ 
        dbname: 'ddedkkl32u3832', 
        host: 'ec2-35-172-85-250.compute-1.amazonaws.com',
        port: 5432,
        user: 'vjslxzoxvkmfdz', 
        password: '348d538c22e8681559d1598b1d205042d9c9ac42f37429ff052ff277acfd12c4'
        })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
