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
  VALUES (?, ?);
  SQL
  db.execute(sql)
  # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  # def self.find(id, db)
  #   sql = <<-SQL
  #   SELECT * FROM pokemon WHERE id = ?;
  #   SQL
  #   db.execute(sql, id).map do |row|
  #     name = row[1]
  #     type = row[2]
  #     new_pokemon = self.new(id, name, type)
  #     new_pokemon
  #   end
  # end
  
end