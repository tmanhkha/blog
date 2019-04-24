namespace :db do
  desc "make user system"
  task make_user: :environment do
    @admin = User.create!(
      name: 'user_admin',
      email: 'admin@gmail.com',
      password: 'blogpass',
      password_confirmation: 'blogpass',
      role: 1
    )
    puts 'Make admin successfully'
  end
end
