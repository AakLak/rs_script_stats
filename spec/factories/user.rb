FactoryBot.define do
  factory :user do
    email 'fafefeaectory@bot.com'
    password 'useruser'
    password_confirmation 'useruser'
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email 'aefae@adede.com'
    password 'adminadmin'
    password_confirmation 'adminadmin'
    admin true
  end
end
