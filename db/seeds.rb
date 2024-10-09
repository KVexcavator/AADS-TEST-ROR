Post.destroy_all
User.destroy_all

first_user = User.create!(
  email: 'example@email.local',
  password: '123456',
  nickname: 'Barmaley'
)

5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    nickname: Faker::Internet.username(specifier: 5..10)
  )

  5.times do
    Post.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      content: Faker::Lorem.paragraph(sentence_count: 2),
      user: user
    )
  end
end

puts "Создано #{User.count} пользователей и #{Post.count} постов."
