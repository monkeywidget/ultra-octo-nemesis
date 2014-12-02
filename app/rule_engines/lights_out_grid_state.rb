class LightsOutGridState < GridState

  def on_grid?(coordinates)
    return (coordinates.y < @y_size && coordinates.x < @x_size && coordinates.x >= 0 && coordinates.y >= 0)
  end

  def toggle_if_on_grid(coordinates)
    return unless on_grid?(coordinates)

    x = coordinates.x
    y = coordinates.y

    if @cells[x][y] > 0
      @cells[x][y] = 0
    else
      @cells[x][y] = 1
    end
  end

  def neighbors_for(coordinates)
    raise ArgumentError.new("(#{coordinates.x},#{coordinates.y}) out of range") unless on_grid?(coordinates)

    [
        coordinates,
        coordinates.north,
        coordinates.south,
        coordinates.west,
        coordinates.east
    ]
  end

  def toggle_neighbors_of(coordinates)
    neighbors_for(coordinates).each do |neighbor|
      toggle_if_on_grid(neighbor)
    end
  end

  # TODO: refactor - this is identical to the superclass
  def self.from_grid_array(cell_array)
    current_state = LightsOutGridState.new(cell_array.size, cell_array.first.size)
    current_state.cells = cell_array
    current_state
  end

end