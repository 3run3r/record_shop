require_relative('..db/sql_runner')

class Artist

  attr_reader(:id, :label_id)
  attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @label_id = options['label_id'].to_i
  end



end
