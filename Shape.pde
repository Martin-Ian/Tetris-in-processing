class Shape
{
  Cell[] boxes = new Cell[4]; //Tetris shapes all have 4 squares
  Shape()
  {
    getNewShape();
  }

  boolean moveDown()
  {
    boolean goodToGo = true;
    for (int i = 0; i < 4; i++)
    {
      if (boxes[i].y >= rows-1 || cells[boxes[i].x][boxes[i].y+1].filled)
      {
        goodToGo = false;
        break;
      }
    }

    for (int i = 0; i < 4 && goodToGo; i++)
    {
      boxes[i].y++;
    }

    if (goodToGo == false)
    {
      for (int i = 0; i < 4; i++)
      {
        int _x = boxes[i].x;
        int _y = boxes[i].y;
        cells[_x][_y].filled = true;
        cells[_x][_y].col = boxes[i].col;
      }
      getNewShape();
    }
    return goodToGo;
  }

  void getNewShape()
  {
    boxes[0] = new Cell(cols/2, 0, true); // All have a base cell
    int type = floor(random(7));
    switch(type)
    {
    case 0: // I shape
      boxes[1] = new Cell(cols/2 - 2, 0, true);
      boxes[2] = new Cell(cols/2 - 1, 0, true);
      boxes[3] = new Cell(cols/2 + 1, 0, true);
      break;
    case 1: // J shape
      boxes[1] = new Cell(cols/2 - 1, -1, true);
      boxes[2] = new Cell(cols/2 - 1, 0, true);
      boxes[3] = new Cell(cols/2 + 1, 0, true);
      break;
    case 2: // L shape
      boxes[1] = new Cell(cols/2 - 1, 0, true);
      boxes[2] = new Cell(cols/2 + 1, -1, true);
      boxes[3] = new Cell(cols/2 + 1, 0, true);
      break;
    case 3: // O shape
      boxes[1] = new Cell(cols/2 - 1, 0, true);
      boxes[2] = new Cell(cols/2 - 1, -1, true);
      boxes[3] = new Cell(cols/2, -1, true);
      break;
    case 4: // S shape
      boxes[1] = new Cell(cols/2 - 1, 0, true);
      boxes[2] = new Cell(cols/2, -1, true);
      boxes[3] = new Cell(cols/2 + 1, -1, true);
      break;
    case 5: // T shape
      boxes[1] = new Cell(cols/2, -1, true);
      boxes[2] = new Cell(cols/2 - 1, -1, true);
      boxes[3] = new Cell(cols/2 + 1, -1, true);
      break;
    case 6: // Z shape
      boxes[1] = new Cell(cols/2 + 1, 0, true);
      boxes[2] = new Cell(cols/2, -1, true);
      boxes[3] = new Cell(cols/2 - 1, -1, true);
      break;
    }
    for (int i = 0; i < 4; i++)
    {
      boxes[i].col = color(map(type, 0, 7, 0, 255), 255, 255);
      boxes[i].filled = true;
    }
  }

  void moveLeft()
  {
    boolean goodToGo = true;
    for (int i = 0; i < 4; i++)
    {
      if (boxes[i].y >= 0 && (boxes[i].x <= 0 || cells[boxes[i].x-1][boxes[i].y].filled))
      {
        goodToGo = false;
        break;
      }
    }

    for (int i = 0; i < 4 && goodToGo; i++)
    {
      boxes[i].x--;
    }
  }

  void rotateLeft()
  {
    boolean goodToGo = true;
    for (int i = 1; i < 4; i++) // Starting at 1 since 0 doesn't move
    {
      int dx = (boxes[i].x - boxes[0].x); // Changes in x and y
      int dy = (boxes[i].y - boxes[0].y);
      int x = boxes[0].x - dy; // To rotate, add deltas to oposite axis
      int y = boxes[0].y + dx;
      if (x < 0 || x >= cols || y < 0 || y >= rows || cells[x][y].filled == true)
      {
        goodToGo = false;
      }
    }
    for (int i = 1; i < 4 && goodToGo; i++) // Starting at 1 since 0 doesn't move
    {
      int dx = (boxes[i].x - boxes[0].x); // Changes in x and y
      int dy = (boxes[i].y - boxes[0].y);
      int x = boxes[0].x - dy; // To rotate, add deltas to oposite axis
      int y = boxes[0].y + dx;
      boxes[i].x = x;
      boxes[i].y = y;
    }
  }

  void moveRight()
  {
    boolean goodToGo = true;
    for (int i = 0; i < 4; i++)
    {
      if (boxes[i].y >= 0 && (boxes[i].x >= cols - 1 || cells[boxes[i].x+1][boxes[i].y].filled))
      {
        goodToGo = false;
        break;
      }
    }

    for (int i = 0; i < 4 && goodToGo; i++)
    {
      boxes[i].x++;
    }
  }

  void rotateRight()
  {
    boolean goodToGo = true;
    for (int i = 1; i < 4; i++) // Starting at 1 since 0 doesn't move
    {
      int dx = (boxes[i].x - boxes[0].x); // Changes in x and y
      int dy = (boxes[i].y - boxes[0].y);
      int x = boxes[0].x + dy; // To rotate, add deltas to oposite axis
      int y = boxes[0].y - dx;
      if (x < 0 || x >= cols || y < 0 || y >= rows || cells[x][y].filled == true)
      {
        goodToGo = false;
      }
    }
    for (int i = 1; i < 4 && goodToGo; i++) // Starting at 1 since 0 doesn't move
    {
      int dx = (boxes[i].x - boxes[0].x); // Changes in x and y
      int dy = (boxes[i].y - boxes[0].y);
      int x = boxes[0].x + dy; // To rotate, add deltas to oposite axis
      int y = boxes[0].y - dx;
      boxes[i].x = x;
      boxes[i].y = y;
    }
  }

  void crashDown()
  {
    boolean canGoDown = true;
    while (canGoDown)
    {
      canGoDown = moveDown();
    }
  }

  void show()
  {
    for (int i = 0; i<4; i++)
    {
      boxes[i].show();
    }
  }
}
