# frozen_string_literal: true

users = [
  { name: 'Antuanette', last_name: 'Hernandez', email: 'antua@mail.com', password: '123456' },
  { name: 'Luis', last_name: 'Chota', email: 'luis@mail.com', password: '123456' },
  { name: 'Jesús', last_name: 'Tuesta', email: 'ayamano@mail.com', password: '123456' }
]

users.each do |user|
  user_created = User.create(user)
  (1..5).each do |i|
    note = Note.create(title: "Note #{i}",
                       body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                       user: user_created)
    Cover.create(cover_url: "https://picsum.photos/200/300?image=#{i}", cover_size: 3699,
                 cover_name: "cover #{i}", note: note)
  end
  puts "User #{user_created.name} created"
end
