# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = [{ username: 'Antuanette', email: 'antua@mail.com', password: '123456' },
         { username: 'Luisftime', email: 'luis@mail.com', password: '123456' },
         { username: 'Ayamano', email: 'ayamano@mail.com', password: '123456' }]

users.each do |user|
  user_test = User.create(user)
  (1..5).each do |num|
    note = Note.create(user_id: user_test.id, title: "Nota de Prueba #{num} ",
                       body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                       color: '#fff')
    Cover.create(note_id: note.id, cover_url: 'https://static.zerochan.net/Sakurajima.Mai.full.2733945.jpg',
                 cover_name: 'Mai San Travel', cover_size: 3_699_000)
  end
end
puts 'Hasta aca llegue'
