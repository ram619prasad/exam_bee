class Answer < ApplicationRecord
    require 'csv'
    belongs_to :question

    def self.import(file)
        data = []
        CSV.foreach(file.path, headers: true) do |row|
            data << row.to_h.merge(created_at: Time.now, updated_at: Time.now)
        end

        Answer.insert_all(data)
    end
end
