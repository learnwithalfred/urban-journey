3.times do
  User.create!(
    [{
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password",
      password_confirmation: "password"
    }])
end


5.times do
  Group.create!(
    [{
      name: Faker::Food.dish,
      icon: Faker::Company.logo,
      user_id: User.all.sample.id
    }])
end


15.times do
  Entity.create!(
    [{
      name: Faker::Food.dish,
      amount: Faker::Number.between(from: 1000, to: 10_000),
      group_id: Group.all.sample.id,
      user_id: User.all.sample.id
    }])
end