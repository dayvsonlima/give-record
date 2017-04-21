require 'spec_helper'

describe GiveRecord::Give do
  before do
    class MyModel < ActiveRecord::Base
      self.table_name = 'mock_table'
    end

    10.times { MyModel.create }
  end

  describe '.give' do
    let(:last_element) { MyModel.last }
    let(:sql_query) do
      'SELECT  "mock_table".* FROM "mock_table" WHERE ' +
      '"mock_table"."id" = ?  ORDER BY "mock_table"."updated_at" DESC LIMIT 1'
    end

    subject { MyModel.give(last_element.id) }

    before do
      MyModel.give(last_element.id)
    end

    it 'Create sql correct' do
      expect(MockLog.last).to include(sql_query)
    end

    it 'return search record' do
      is_expected.to eq(last_element)
    end
  end
end
