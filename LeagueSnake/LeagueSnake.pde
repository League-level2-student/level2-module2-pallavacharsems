//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;

// Add a constructor with parameters to initialize each variable.

Segment(int x, int y){
  this.x = x;
  this.y = y;

}
}
//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*

Segment head;
int foodX;
int foodY;
int direction = UP;
int numE = 0;
ArrayList<Segment> tail = new ArrayList<Segment>();

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
head = new Segment(250, 250);
frameRate(20);
dropFood();

}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0, 0, 0);
  drawFood();
  move();
  drawSnake();
  eat();
 
}

void drawFood() {
  //Draw the food
  fill(#FA2E0A);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(#FA0AEA);
  rect(head.x, head.y, 10, 10);
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
 fill(#FA0AEA);
for(int i = 0; i<tail.size(); i++ ) {
 Segment t = tail.get(i);
  rect(t.x, t.y, 10, 10);
}
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
 checkTailCollision();
 drawTail(); 
 Segment g = new Segment(head.x, head.y);
 tail.add(g);
 tail.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment

  for(int i = 0; i<tail.size(); i++){
    Segment t = tail.get(i);
    if(t.x == head.x && t.y == head.y){
      Segment g = new Segment(head.x, head.y);  
      tail = new ArrayList<Segment>();
      numE = 1;      
      tail.add(g);
    }
  }

}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if (key == CODED){
    if (keyCode == UP){
       if (direction != DOWN){
         direction = UP;
       }
    } else if(keyCode == DOWN){
     if (direction != UP){
      direction = DOWN; 
     }
    }
    else if(keyCode == LEFT){
     if (direction != RIGHT){
      direction = LEFT; 
     }
    }
    else if(keyCode == RIGHT){
  if (direction != LEFT){
         direction = RIGHT; 
    
  }
}
}
}
void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
    head.y += -10;
    break;
  case DOWN:
   head.y += 10;
    break;
  case LEFT:
   head.x += -10;
    break;
  case RIGHT:
    head.x += 10; 
    break;
    
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.x > 500){
   head.x = head.x - 500;
} else if (head.x < 0){
  head.x = head.x+500;
}
if (head.y > 500){
  head.y = head.y-500;
} 
else if (head.y < 0){
  head.y = head.y+500;
}
}


void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if (head.x == foodX && head.y == foodY){
  numE = numE+1;
  Segment g = new Segment(head.x, head. y);
  tail.add(g);
  dropFood();
  println(tail.size());
  
}
}
