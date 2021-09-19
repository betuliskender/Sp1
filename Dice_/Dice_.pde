DiceCup diceCup = new DiceCup();


void setup() {
  size(650, 650);
  rectMode(CENTER);
  background (150);
  diceCup.draw(x, y, size);
}

void draw() {
}


void keyPressed() {
  // hver gang man trykker enter kommer der nye random tal
  if (key == ENTER) {
    background (150);
    diceCup.shake();
    diceCup.draw(x, y, size);
  }

  //hver gang man trykker på 1 kommer der en ny terning
  if (key == '1') {
    background (150);
    Die die = new Die(0, 255);
    diceCup.addDie(die);
    diceCup.draw(x, y, size);
  }
}

int y = 50;
int x = 50;
int size = 10;

class Die {

  color eyeColor;
  color dieColor;
  int eyes = (int)random(1, 7);
  int x;
  int y;

  public Die(color eyeColor, color dieColor) {
    this.eyeColor=eyeColor;
    this.dieColor=dieColor;
  }
  public int rollDie() {
    eyes = (int)random(1, 7);
    return eyes;
  }

  public int getEyes() {
    return eyes;
  }

  void draw(int x, int y, int size) {
    fill(255);
    noStroke();
    rect(x, y, 50, 50, 5);
  
    if (eyes ==1 || eyes == 3 || eyes == 5) {
      fill(0);
      ellipse(x, y, 10, 10);
    }
    if (eyes ==2 ||  eyes == 3 || eyes == 4 || eyes == 5 || eyes == 6) {
      fill(0);
      ellipse(x - 18, y - 18, 10, 10);
      ellipse(x + 18, y + 18, 10, 10);
    }
    if (eyes == 4 || eyes == 5 || eyes == 6) {
      fill(0);
      ellipse(x - 18, y + 18, 10, 10);
      ellipse(x + 18, y - 18, 10, 10);
    }
    if (eyes == 6) {
      fill(0);
      ellipse(x, y - 18, 10, 10);
      ellipse(x, y + 18, 10, 10);
    }
  }
}

  class DiceCup {

  private ArrayList<Die> diceList;

  private ArrayList<Die> die1 = new ArrayList<Die>();
  private ArrayList<Die> die2 = new ArrayList<Die>();
  private ArrayList<Die> die3 = new ArrayList<Die>();
  private ArrayList<Die> die4 = new ArrayList<Die>();
  private ArrayList<Die> die5 = new ArrayList<Die>();
  private ArrayList<Die> die6 = new ArrayList<Die>();


  public DiceCup() {
    diceList= new ArrayList<Die>();
  }

  public void addDie(Die die) {
    diceList.add(die);
  }

  public void draw(int x, int y, int size) {
    die1.clear();
    die2.clear();
    die3.clear();
    die4.clear();
    die5.clear();
    die6.clear();

    for (Die d : diceList) {
      int eyes = d.getEyes();
      println(eyes);
      if ( eyes == 1) {
        die1.add(d);
      } else if ( eyes == 2 ) {
        die2.add(d);
      } else if ( eyes == 3 ) {
        die3.add(d);
      } else if ( eyes == 4 ) {
        die4.add(d);
      } else if ( eyes == 5 ) {
        die5.add(d);
      } else if ( eyes == 6 ) {
        die6.add(d);
      }
    }

    int xpos = x + (x / 2);
    int ypos = y + (y/2);
    int rowCounter = 0;

    for (int i = 0; i < die1.size(); i++) {
      die1.get(i).draw(x+i*xpos, y, size);
    }
    if (!die1.isEmpty())
    {
      rowCounter++;
    }

    for (int i = 0; i < die2.size(); i++) {
      die2.get(i).draw(x+i*xpos, y+ypos*rowCounter, size);
    }
    if (!die2.isEmpty())
    {
      rowCounter++;
    }
    for (int i = 0; i < die3.size(); i++) {
      die3.get(i).draw(x+i*xpos, y+ypos*rowCounter, size);
    }
    if (!die3.isEmpty())
    {
      rowCounter++;
    }
    for (int i = 0; i < die4.size(); i++) {
      die4.get(i).draw(x+i*xpos, y+ypos*rowCounter, size);
    }
    if (!die4.isEmpty())
    {
      rowCounter++;
    }
    for (int i = 0; i < die5.size(); i++) {
      die5.get(i).draw(x+i*xpos, y+ypos*rowCounter, size);
    }
    if (!die5.isEmpty())
    {
      rowCounter++;
    }
    for (int i = 0; i < die6.size(); i++) {
      die6.get(i).draw(x+i*xpos, y+ypos*rowCounter, size);
    }
  }

  public void shake() {
    for (int i = 0; i < diceList.size(); i++)
    {
      diceList.get(i).rollDie();
    }
  }
}
