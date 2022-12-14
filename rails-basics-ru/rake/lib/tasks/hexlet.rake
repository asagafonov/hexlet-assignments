# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Imports users from a csv file'
  task :import_users, [:path] => :environment do |_, args|
    path = args[:path]
    users = File.read(path)

    csv = CSV.parse(users, headers: true)

    csv.each do |row|
      parsed_birthday = DateTime.strptime(row['birthday'], '%m/%d/%Y')
      User.create!(row.to_hash.merge(birthday: parsed_birthday))
    end
  end
end
