binary = """
The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. 
"""

# 1.5MB
binary_1 = String.duplicate(binary, 10000)
# 11.5 MB
binary_2 = String.duplicate(binary, 100_000)

IO.puts("""
\n
====================================
=== Using binary size: #{inspect(byte_size(binary))} bytes ===
====================================
""")

Benchee.run(
  %{
    "preciz/similarity" => fn -> Similarity.simhash(binary, binary) end,
    "UniversalAvenue/simhash-ex" => fn -> Simhash.similarity(binary, binary) end,
    "holsee/spirit_fingers" => fn -> SpiritFingers.SimHash.similarity(binary, binary) end
  },
  time: 10,
  memory_time: 2
)

IO.puts("""
\n\n
========================================
=== Using binary size: #{inspect(byte_size(binary_1))} bytes ===
========================================
""")

IO.puts("Note: excluding UniversalAvenue/simhash-ex as it errors.\n")

Benchee.run(
  %{
    "preciz/similarity" => fn -> Similarity.simhash(binary_1, binary_1) end,
    # "UniversalAvenue/simhash-ex" => fn -> Simhash.similarity(binary, binary) end,
    "holsee/spirit_fingers" => fn -> SpiritFingers.SimHash.similarity(binary_1, binary_1) end
  },
  time: 10,
  memory_time: 2
)

IO.puts("""
\n\n
=================================================
=== Spirit Fingers using various binary sizes ===
=================================================
""")

IO.puts(
  "Note: excluding preciz/similarity as memory usage was extreme and results didn't show within 10 mins"
)

IO.puts("Note: excluding UniversalAvenue/simhash-ex as it errors.\n")

Benchee.run(
  %{
    "holsee/spirit_fingers (#{inspect(byte_size(binary))} bytes)" => fn ->
      SpiritFingers.SimHash.similarity(binary, binary)
    end,
    "holsee/spirit_fingers (#{inspect(byte_size(binary_1) / 1_000_000)} MB)" => fn ->
      SpiritFingers.SimHash.similarity(binary_1, binary_1)
    end,
    "holsee/spirit_fingers (#{inspect(byte_size(binary_2) / 1_000_000)} MB)" => fn ->
      SpiritFingers.SimHash.similarity(binary_2, binary_2)
    end
  },
  time: 10,
  memory_time: 2
)
