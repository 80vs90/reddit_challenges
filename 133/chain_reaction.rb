#!/usr/bin/env ruby

require_relative 'grid'

# Main execution

grid_info = gets

# Read through each line and add element to array
elements = Array.new
elem_names = ('A'..'Z').to_a
i = 0
while (line = gets)
  elem_info = line.split
  elem = Element.new(elem_info[0],elem_info[1],elem_info[2],elem_info[3],elem_names[i])
  i += 1
  elements << elem
end

# Create the grid and display it as step 1
grid = Grid.new(grid_info.split[1], elements)

#Print initial grid
step_counter = 0
puts "Step #{step_counter}:"
step_counter += 1
print grid.display

#Activate initial element
grid.elements_on_deck[0].activate!
puts "Step #{step_counter}:"
step_counter += 1
print grid.display

# Keep activating 'til ya can't
while grid.activate
  puts "Step #{step_counter}:"
  print grid.display
  step_counter += 1
end
