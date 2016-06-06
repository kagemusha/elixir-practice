IO.puts "for"

cards = [["a", 1970], ["b", 1980]]

for card <- cards do
  [event , year ] = card
  IO.puts "Event: #{event} year: #{year}"
end

for i <- 0..5 do
  IO.puts i
end