class User < ActiveRecord::Base
  attr_accessible :email, :id_number, :name, :phone, :resting_heart_rate, :surname, :blood_gas_test

  def self.to_csv(options = {})

    CSV.generate(options) do |csv|

      csv << column_names
      all.each do |header|
        csv << header.attributes.values_at(*column_names)
      end
    end
end
end
