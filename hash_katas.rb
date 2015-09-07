# Hash.each_with_index
# [4,8,15,16,23,42].each_with_index { |e, i| puts "#{e} -- #{i}" }
[[1,2,3,4],
 [5,6,7,8],
 ['a','b','c','d'],
 ['e','f','g','h']
].each_with_index do |lat, lat_index| 
  lat.each_with_index { |e, i| puts "#{e}, #{i}-#{lat_index}" }
end

# def map_value(array)
#   array.map { |e| e + 1}
# end
# p map_value([3,7,14,15,22,41])

# # hashkey example
# def hash_keys(hash)
#   hash.map { |e| p e[0] }
# end
# hash = {a: 'apple', b: 'bear'}
# hash_keys(hash)

# # inject
# [4,8,25,26,34,42].inject(0) do |accumulator, iterated|
#   accumulator += iterated
#   p accumulator
# end

# def custom_inject(array, default = 0)
#   accumulator = default || array[0]
#   array.each { |element| accumulator += element }
#   accumulator
# end
# p custom_inject([2,2,2], 2)

# [4, 8, 15, 16, 23, 42].inject({}) do |a, i|
#   a.update(i => i)
#   p a
# end

# # build a hash with inject
# def occurrences(string)
#   string.scan(/\w+/).inject(Hash.new(0)) do |hash, word|
#     hash[word] += 1
#     hash
#   end
# end
# p occurrences('hello what are you doing today let\'s play today')

# # factorial method
# def factorial(x)
#   x == 1 ? 1 : x * (x-1)
# end

# p factorial(1)

# # factorial hash memoization
# factorial_hash ||= Hash.new do |hash, key|
#   hash[key] = key * hash[key-1]
# end

# factorial_hash[1] = 1; factorial_hash[2] = 2

# def factorial(n)
#   # where is the running total of 'n' stored?
#   n == 1 ? 1 : n * (n - 1)
# end

# p factorial(3)

# factorial_hash ||= Hash.new do |hash, key|
#   # where is the running total of 'key' stored?
#   # if you do 'p key' above the line below it out puts: 4,3,2
#   hash[key] = key * hash[key - 1]
#   # if you do 'p key' above the line below it out puts: 2,3,4
# end

# factorial_hash[1] = 1
# factorial_hash[4]
