module GiveRecord
  module Give
    extend ActiveSupport::Concern

    class_methods do
      def give(id)
        order(updated_at: :desc).find_by(id: id)
      end
    end
  end

  ::ActiveRecord::Base.send(:include, GiveRecord::Give)
end
