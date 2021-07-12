require 'Peep'

describe Peep do
    describe '#all' do
      it 'returns all peeps' do
        connection = PG.connect(dbname: 'chitter_test')
        connection.query('TRUNCATE all_peeps RESTART IDENTITY CASCADE;')

        peepone = Peep.create(peep_text: 'My first test peep', time: 'NOW()')
        peeptwo = Peep.create(peep_text: 'My second peep', time: 'NOW()')

        peeps = Peep.all

        expect(peeps.length).to eq 2
        expect(peeps.first).to be_a Peep
        expect(peeps[0].id).to eq "2"
        expect(peeps[0].peep_text).to eq 'My second peep'
        expect(peeps[0].time[0...16]).to eq(Time.now.strftime("%Y-%m-%d %H:%M"))

        expect(peeps[1]).to be_a Peep
        expect(peeps[1].id).to eq "1"
        expect(peeps[1].peep_text).to eq 'My first test peep'
        expect(peeps[1].time[0...16]).to eq(Time.now.strftime("%Y-%m-%d %H:%M"))
      end
    end

    describe '#create' do
      it 'creates a new peep' do
        peep = Peep.create(peep_text: 'My second test peep', time: 'NOW()')
        data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM all_peeps WHERE id = #{peep.id};")
        timenow = Time.now.to_s
        expect(peep).to be_a Peep
        expect(peep.id).to eq data.first['id']
        expect(peep.peep_text).to eq 'My second test peep'
        expect(peep.time[0...16]).to eq(timenow[0...16])
      end
    end
end
