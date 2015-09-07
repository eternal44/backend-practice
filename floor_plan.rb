# This script will find the best place to build the kitchen
# '_' = blank space
# 'X' = unavailable space
# 'E' = engineer

floor_plan =[
  ['X X X X X X X X X'],
  ['X E X X X _ X E X'],
  ['X _ X X X _ X X X'],
  ['X _ X X X E X _ X'],
  ['X _ X X X _ X _ X'],
  ['X _ X X X _ X _ X'],
  ['X X X X X X X X X'],
]

# create an array of arrays to determine engineer coordinates
floor_plan.map! { |s| s[0].split(' ') }

# map each space to a coordinate
@hash = Hash.new("")
floor_plan.each_with_index do |lat, lat_index|
  lat.each_with_index do |long, long_index|
    @hash[[long_index,lat_index]] += "#{long}"
  end
end

eng_coord = []
@hash.each do |coord|
  eng_coord << coord[0] if coord[1] == "E"
end

def average(numbers_array, index)
  (numbers_array.inject(0.0) { |sum, el| sum + el[index] } / numbers_array.size).round
end

def best_coordinates(eng_coord)
  best_coord = [average(eng_coord, 0), average(eng_coord, 1)]
  hash_lookup = @hash.fetch([average(eng_coord, 0), average(eng_coord, 1)])

  if hash_lookup != "X"
    best_coord
  else
    puts "Landed on an X."
    alternate_coords = []

    # list all possible coordinates near by
    best_coord << best_coord[0] - 1
    best_coord << best_coord[0] + 1
    best_coord = best_coord.permutation(2).to_a.sort.reverse
    best_coord.each do |coord|
      alternate_coords << coord if @hash.fetch(coord) != 'X'
    end
    puts "Altnernate coordinates:"

    # pick an alternate
    alternate_coords[((alternate_coords.length - 1) / 2).round]
  end
end

p best_coordinates(eng_coord)

