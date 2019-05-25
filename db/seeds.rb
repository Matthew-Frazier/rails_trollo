4.times do 
  board = Board.create(
  name: Faker::Company.name
  )

  4.times do
    list = List.create(
      name: Faker::Company.industry,
      board_id: board.id
    )

    3.times do
      Task.create(
        description: Faker::Company.bs,
        list_id: list.id
      )
    end
  end
end

puts "seeds created"