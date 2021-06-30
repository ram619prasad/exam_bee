class Question < ApplicationRecord
    require 'csv'

    def self.import(file)
        data = []
        CSV.foreach(file.path, headers: true) do |row|
            data << row.to_h.merge(created_at: Time.now, updated_at: Time.now)
        end

        Question.insert_all(data)
    end
end
