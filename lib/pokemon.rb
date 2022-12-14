class Pokemon
    attr_accessor :name,:type
    attr_reader:id,:db
    def initialize(id:,name:,type:,db:)
        @id=id
        @name=name
        @type=type
        @db=db
    end

    def self.save(name,type,db)
        sql = <<-SQL
          INSERT INTO pokemon (name, type)
          VALUES (?, ?)
        SQL
    
        db.execute(sql, name, type)
    
      end

      
      def self.find(id_num, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
            SQL

        db.execute(sql, id_num).map do |row|
            self.new(id:row[0],name:row[1],type:row[2],db:db)
        end.first
    end
end
