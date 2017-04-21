require 'rspec'
require 'active_record'
require 'give-record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)

RSpec.configure do |config|
  config.before(:each) do
    ActiveRecord::Base.connection.create_table :mock_table do |t|
      t.timestamps null: false
    end
  end

  config.after(:each) do
    ActiveRecord::Base.connection.drop_table :mock_table
  end
end
