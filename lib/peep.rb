require 'pg'

class Peep

  attr_reader :id, :message, :user_id, :timestamp

  def initialize(id:, message:, user_id:, timestamp:)
    @id = id 
    @message = message
    @user_id = user_id
    @timestamp = timestamp
  end  

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else 
      connection = PG.connect(dbname: 'peep_manager')
    end 
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message'], user_id: peep['user_id'], timestamp: result[0]['timestamp'])
    end 
  end

  def self.create(message:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')    
    else
      connection = PG.connect(dbname: 'peep_manager')
    end 
    
    result = connection.exec("INSERT INTO peeps (message, user_id) VALUES ('#{message}', '#{user_id}') RETURNING id, message, user_id, timestamp;")

    Peep.new(id: result[0]['id'], message: result[0]['message'], user_id: result[0]['user_id'], timestamp: result[0]['timestamp'])
  end 
end
 

#Ordering results by date 
# result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
#     result.map { |peep| peep['message'] } 