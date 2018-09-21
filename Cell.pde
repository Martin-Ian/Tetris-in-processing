class Cell
{
  boolean filled;
  color col;
  int x, y;

  Cell(int _x, int _y, boolean _filled)
  {
    x = _x;
    y = _y;
    filled = _filled;
    col = color(50);
  }

  void show()
  {
    strokeWeight(1);
    if (filled == true)
    {
      strokeWeight(3);
    }
    stroke(0);
    fill(col);
    rect(x * cellSize, y * cellSize, cellSize, cellSize);
  }
}
