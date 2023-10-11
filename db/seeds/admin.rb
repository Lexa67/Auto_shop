if Admin.count.zero?
  puts 'Seeding Admin'
  Admin.create!(email: 'john@dow.com', first_name: 'Alex', last_name: 'Kres', password: 'password', password_confirmation: 'password')
end