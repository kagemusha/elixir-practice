t = {}
    |> Tuple.append(4)
    |> Tuple.append(7)
    |> Tuple.insert_at(1, 52)
    |> Tuple.delete_at(0)

IO.puts inspect(t)