def oranges_rotting(grid):
  if not any(1 in row for row in grid):
    return 0
  
  count_minutes = 0
  spoiled_grid = None
  rows = len(grid)
  columns = len(grid[0])
  
  while grid != spoiled_grid:
    #create a copy of grid, if use spoiled_grid=grid the memory space is the same sp the while will be true
    spoiled_grid = [row[:] for row in grid] 
    for x in range(rows):
      for y in range(columns):
       if spoiled_grid[x][y] == 2:
          if y - 1 >= 0 and spoiled_grid[x][y-1] == 1: grid[x][y-1] = 2
          if y + 1 < columns and spoiled_grid[x][y+1] == 1: grid[x][y+1] = 2
          if x - 1 >= 0 and spoiled_grid[x-1][y] == 1: grid[x-1][y] = 2
          if x + 1 < rows and spoiled_grid[x+1][y] == 1: grid[x+1][y] = 2
        
    count_minutes+=1


  if any(1 in row for row in grid):
    return -1
  
  return count_minutes-1
