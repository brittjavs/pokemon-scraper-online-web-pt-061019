class Pokemon
attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
  end
  
  def self.save(name, type, db)
  sql = <<-SQL
  INSERT INTO pokemon(name, type)
  VALUES (?, ?)
  SQL
  DB[:conn].execute(sql)
  @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(number, db)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id = ? LIMIT 1
    SQL
    DB[:CONN].execute(sql, self.id, self.db).map do |row|
      id = row[0]
      name = row[1]
      type = row[2]
      self.new(id, name, type)
    end
  end
  
end