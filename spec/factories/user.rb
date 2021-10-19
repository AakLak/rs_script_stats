FactoryBot.define do
  factory :user do
    email {'fafefeaectory@bot.com'}
    password {'useruser'}
    password_confirmation {'useruser'}
    id {2}
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email {'aefae@adede.com'}
    password {'adminadmin'}
    password_confirmation {'adminadmin'}
    id {1}
    admin {true}
  end
end
