int rows, cols, cellSize = 25;
Shape S;
Cell[][] cells;

void setup()
{
  size(500, 700);
  rows = height / cellSize;
  cols = width / cellSize;
  cells = new Cell[cols][rows];
  colorMode(HSB);
  for (int i = 0; i < cells.length; i++)
  {
    for (int j = 0; j < cells[i].length; j++)
    {
      cells[i][j] = new Cell(i, j, false);
    }
  }
  S = new Shape();
}

void draw()
{
  background(50);
  if (frameCount % 10 == 0)
  {
    S.moveDown();
  }

  for (int j = 0; j < cells[0].length; j++)
  {
    boolean rowCleared = true; // Assume true; prove it wrong
    for (int i = cells.length - 1; i >= 0; i--) // Go in reverse order, bottom to top
    {                                           // This is so we can grab the above row, if multiple are deleted...
      cells[i][j].show();
      if (cells[i][j].filled == false)
      {
        rowCleared = false;
      }
    }
    if (rowCleared) // A Whole row had boxes in every square
    {
      for (int k = j; k > 0; k--)
      {
        for (int l = 0; l < cells.length; l++)
        {
          cells[l][k].filled = cells[l][k-1].filled;
          cells[l][k].col = cells[l][k-1].col;
        }
      }
    }
  }
  S.show();
}

void keyPressed()
{
  if (key == 'A' || key == 'a')
  {
    S.moveLeft();
  }
  if (key == 'D' || key == 'd')
  {
    S.moveRight();
  }
  if (key == 'Z' || key == 'z')
  {
    S.rotateLeft();
  }
  if (key == 'X' || key == 'x')
  {
    S.rotateRight();
  }
  if (key == ' ')
  {
    S.crashDown();
  }
}
