require 'peep'

describe Peep do 
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')

      # test data
      connection.exec("INSERT INTO peeps (message) VALUES ('Peep 1');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Peep 2');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Peep 3');")

      peeps = Peep.all

      expect(peeps).to include("Peep 1")
      expect(peeps).to include("Peep 2")
      expect(peeps).to include("Peep 3")

    end
  end
end
