# Simhash Bench

A quick comparison of the top 3 elixir Simhash packages available for raw performance.

## Results!

🏆 [holsee/spirit_fingers](https://github.com/holsee/spirit_fingers)
* The raw performance of the Rust NIFs used by [holsee/spirit_fingers](https://github.com/holsee/spirit_fingers) is undeniable for raw throughput. 
* Handles larger binary sizes.

🥈 [UniversalAvenue/simhash-ex](https://github.com/UniversalAvenue/simhash-ex) 
* Fun fact [@bartolsthoorn](https://github.com/bartolsthoorn) author of [UniversalAvenue/simhash-ex](https://github.com/UniversalAvenue/simhash-ex) is the author of the Rust NIFs [bartolsthoorn/simhash-rs](https://github.com/bartolsthoorn/simhash-rs) leveraged by [holsee/spirit_fingers](https://github.com/holsee/spirit_fingers) 👏.
* Failed to run with 1.15 MB binary, due to a bug.

🥉 [preciz/similarity](https://github.com/preciz/similarity)
* With honourable mention to [preciz/similarity](https://github.com/preciz/similarity) for touting some really powerful features and a richer API.
* Used a large amount of RAM (>5GB) 5.65 GB - Rust profiling will be needed for accurate comparison, but appears to be much less. 
* Couldn't run benchmark with 11.5 MB binary, didn't complete within 10 mins strangely.

## Full Benchmarks

`mix run benchmarks/simhashing.exs`


```
====================================
=== Using binary size: 115 bytes ===
====================================

Operating System: macOS
CPU Information: Apple M1 Pro
Number of Available Cores: 10
Available memory: 16 GB
Elixir 1.14.3
Erlang 25.0.4

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 2 s
reduction time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 42 s

Benchmarking UniversalAvenue/simhash-ex ...
Benchmarking holsee/spirit_fingers ...
Benchmarking preciz/similarity ...

Name                                 ips        average  deviation         median         99th %
holsee/spirit_fingers           860.25 K        1.16 μs   ±221.80%        1.13 μs        1.42 μs
UniversalAvenue/simhash-ex        2.15 K      464.88 μs    ±13.30%      454.50 μs      577.06 μs
preciz/similarity                 1.83 K      546.94 μs    ±56.76%      512.75 μs      835.84 μs

Comparison:
holsee/spirit_fingers           860.25 K
UniversalAvenue/simhash-ex        2.15 K - 399.92x slower +463.72 μs
preciz/similarity                 1.83 K - 470.50x slower +545.78 μs

Memory usage statistics:

Name                          Memory usage
holsee/spirit_fingers            0.0391 KB
UniversalAvenue/simhash-ex       542.38 KB - 13884.80x memory usage +542.34 KB
preciz/similarity                588.42 KB - 15063.60x memory usage +588.38 KB

**All measurements for memory usage were the same**

```

```
========================================
=== Using binary size: 1150000 bytes ===
========================================

Note: excluding UniversalAvenue/simhash-ex as it errors.

Operating System: macOS
CPU Information: Apple M1 Pro
Number of Available Cores: 10
Available memory: 16 GB
Elixir 1.14.3
Erlang 25.0.4

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 2 s
reduction time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 28 s

Benchmarking holsee/spirit_fingers ...
Benchmarking preciz/similarity ...

Name                            ips        average  deviation         median         99th %
holsee/spirit_fingers         73.70       0.0136 s     ±3.00%       0.0136 s       0.0144 s
preciz/similarity            0.0805        12.41 s     ±0.00%        12.41 s        12.41 s

Comparison:
holsee/spirit_fingers         73.70
preciz/similarity            0.0805 - 914.98x slower +12.40 s

Memory usage statistics:

Name                     Memory usage
holsee/spirit_fingers      0.00000 GB
preciz/similarity             5.65 GB - 151767819.00x memory usage +5.65 GB

**All measurements for memory usage were the same**

```

```
=================================================
=== Spirit Fingers using various binary sizes ===
=================================================

Note: excluding preciz/similarity as memory usage was extreme and results didn't show within 10 mins
Note: excluding UniversalAvenue/simhash-ex as it errors.

Operating System: macOS
CPU Information: Apple M1 Pro
Number of Available Cores: 10
Available memory: 16 GB
Elixir 1.14.3
Erlang 25.0.4

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 2 s
reduction time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 42 s

Benchmarking holsee/spirit_fingers (1.15 MB) ...
Benchmarking holsee/spirit_fingers (11.5 MB) ...
Benchmarking holsee/spirit_fingers (115 bytes) ...

Name                                        ips        average  deviation         median         99th %
holsee/spirit_fingers (115 bytes)     849385.51     0.00118 ms    ±76.96%     0.00117 ms     0.00133 ms
holsee/spirit_fingers (1.15 MB)           73.25       13.65 ms     ±3.17%       13.77 ms       14.42 ms
holsee/spirit_fingers (11.5 MB)            7.31      136.83 ms     ±2.27%      137.00 ms      143.26 ms

Comparison:
holsee/spirit_fingers (115 bytes)     849385.51
holsee/spirit_fingers (1.15 MB)           73.25 - 11595.12x slower +13.65 ms
holsee/spirit_fingers (11.5 MB)            7.31 - 116218.34x slower +136.83 ms

Memory usage statistics:

Name                                 Memory usage
holsee/spirit_fingers (115 bytes)            40 B
holsee/spirit_fingers (1.15 MB)              40 B - 1.00x memory usage +0 B
holsee/spirit_fingers (11.5 MB)              40 B - 1.00x memory usage +0 B

**All measurements for memory usage were the same**
------------------------------------------------------
```
