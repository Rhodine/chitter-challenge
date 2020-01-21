require 'database_helpers'
require 'chitter'
require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(name: 'John Doe', username: 'Rodeo', email: 'test@example.com', password: 'password123')

    persisted_data = persisted_data(table: 'users', id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data['id']
    expect(user.name).to eq 'John Doe'
    expect(user.username).to eq 'Rodeo'
    expect(user.email).to eq 'test@example.com'
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(name: 'John Doe', username: 'Rodeo', email: 'test@example.com', password: 'password123')
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.name).to eq user.name
    expect(result.username).to eq user.username
    expect(result.email).to eq user.email
  end
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
end
