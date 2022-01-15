require 'peep'

describe Peep do 
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')

      # test data
      new_peep = Peep.create(message: 'Peep 1', user_id: 'Josh Lim')
      Peep.create(message: 'Peep 2', user_id: 'Josh Lim')
      Peep.create(message: 'Peep 3', user_id: 'Josh Lim')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.last).to be_a Peep
      # expect(peeps.first.id).to eq new_peep.id
      expect(peeps.last.message).to eq 'Peep 1'
      expect(peeps.last.user_id).to eq 'Josh Lim'

    end
  end

  describe '.create' do 
    it 'creates a new peep' do
      peep = Peep.create(message: 'test peep', user_id: 'test_user')
      persisted_data = PG.connect(dbname: 'peep_manager_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'test peep'
      expect(peep.user_id).to eq 'test_user'

    end 
  end
end 
