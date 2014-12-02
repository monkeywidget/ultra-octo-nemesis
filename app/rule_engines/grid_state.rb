class GridState

  attr_reader :x_size
  attr_reader :y_size

  # to keep the x,y in order, this is an array of columns
  attr_accessor :cells

  def self.default_state(dim_x,dim_y)
    GridState.new(dim_x,dim_y)
    GridState.cells = Array.new(dim_x) { Array.new(dim_y){0} }
  end

  def initialize(dim_x,dim_y)
    @x_size = dim_x
    @y_size = dim_y
  end

  # input: build by rows: row 0, then row 1...
  # @param [String] a CSV from (0,0) to (X_MAX-1,0)
  #                       from (0,1) to (X_MAX-1,1)
  #                       ...
  #                       from (0,Y_MAX-1) to (X_MAX-1,Y_MAX-1)
  def self.from_csv(csv_list, dim_x = nil, dim_y = nil )
    token_list = csv_list.split(',')

    if dim_x.nil?
      dim_x = Math.sqrt(token_list.size)
      raise ArgumentError.new("this is not a square number of elements") if dim_x % 1 != 0
      dim_y = dim_x
    else
      dim_y = token_list/dim_x if dim_y.nil?
      raise ArgumentError.new("this is not a rectangular number of elements") if dim_y % 1 != 0
    end

    grid = GridState.new(dim_x,dim_y)

    # puts "DEBUG: grid is #{grid}"
    # puts "DEBUG: grid.cells is #{grid.cells}"

    token_list.each_with_index do |element_value, index|
      x_index = index % dim_y
      y_index = index / dim_y
      grid.cells[x_index][y_index] = element_value
    end

    grid
  end


  def self.from_grid_array(cell_array)
    current_state = GridState.new(cell_array.size, cell_array.first.size)
    current_state.cells = cell_array
    current_state
  end

end
=begin
# debug code:
width = 3
height = 3
puts "testing: grid: (#{width}x#{height})"
# grid = GridState.default_state(width,height)
grid = GridState.from_csv("0,0,0,1,2,3,9,8,7")
puts "DEBUG: grid.cells is #{grid.cells}"

grid.cells[2][1] = 'fnrd'
(height-1).downto(0).each do |y|
  print "\t #{y}: "
  (0..(width-1)).each do |x|
    print "#{grid.cells[x][y]} "
  end
  print "\n"
end
puts "test complete"
=end

