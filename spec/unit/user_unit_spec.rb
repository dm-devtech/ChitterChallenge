require 'User'

describe User do
  describe '#all shows users' do
    it 'expects to see the users name' do
      User.create(username: "my username11", name: "name22", email: "email@email.com33", password: "my password44")
      expect(User.all).to include("my username11")
    end
  end
end

  describe '#create a new user' do
    it 'create a new user' do
      user = User.create(username: "myusername", name: "my name222", email: "email@email.com333", password: "my password444")
      data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM all_users;")
      expect(data.first['username']).to eq("myusername")
      expect(data.first['name']).to eq("my name222")
      expect(data.first['email']).to eq("email@email.com333")
      expect(data.first['password']).to eq("my password444")
    end
  end
