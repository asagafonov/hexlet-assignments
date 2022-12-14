# frozen_string_literal: true

namespace :hexlet do
  desc 'Imports users from a csv file'
  task :import_users, [:path] => :environment do |_, args|
    path = args[:path]
    users = File.read(path).to_s.split("\n").drop(1)

    users.each do |user|
      user_data = user.split(',')
      first_name, last_name, birthday, email = user_data

      User.create(
        first_name:,
        last_name:,
        birthday:,
        email:
      )
    end
  end
end
