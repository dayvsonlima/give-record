require 'rspec'
require 'active_record'
require 'give-record'
require File.expand_path(File.dirname(__FILE__) + '/support/mocks/mock_log')

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)

RSpec.configure do |config|
  config.before(:each) do
    ActiveRecord::Base.logger = MockLog.new
    ActiveRecord::Base.connection.create_table :mock_table do |t|
      t.timestamps null: false
    end
  end

  config.after(:each) do
    ActiveRecord::Base.connection.drop_table :mock_table
  end
end
