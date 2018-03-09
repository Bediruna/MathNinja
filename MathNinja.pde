//Bedir Aygun 4/8/2016
 
 
 //the sound library is imported
  import processing.sound.*;
  //sound variables are declared
  SoundFile backGroundSound;
  SoundFile jumpSound;
  SoundFile vaseBreakSound;
  SoundFile bombSound;
  SoundFile swordSound;
  
  //images are declares
  PImage[] ninja = new PImage[18];
  PImage dojoBG = new PImage();
  PImage[] vase = new PImage[5];
  PImage[] explosion = new PImage[4];
  PImage heart = new PImage();
  PImage dart = new PImage();
  PImage pauseScreen = new PImage();
  PImage winScreen = new PImage();
  PImage gameOverScreen = new PImage();
  PImage jumpInstruct = new PImage();
  PImage attackInstruct = new PImage();

  //texts are declared
  PFont felix;
  PFont calibri;
  
  //variable for heart's x value
  int heartX;
  
  //declares game variables
  byte gameState;
  byte lives;
  byte level;
  byte vasePassCounter;
  byte explosionFrame;
  boolean jumped;
  boolean sliced;
  boolean vaseBroken;
  boolean helpStepChanged;
  boolean wrongVaseBroken;

  int playerSpeed;
  int playerX;
  int playerY;
  int score = 0;
  int streak = 0;
  int instructionsTimer;
  
  byte playerFrame;
  byte jumpAnimation;
  int gravity;
  byte restMovement;
  byte vaseBreaker;
  int vaseX;
  int backgroundX;

  int num1;
  int num2;
  
  int result;
  int vaseNumber;
  int helpStep;
  int jumpCounter;
  
void setup(){
  
  //backGroundSound = new SoundFile(this, "BackGroundMusic.mp3");
  /*//https://www.youtube.com/watch?v=Uj5H4vJoCOw
  
  backGroundSound.loop();
  
  //this file was too loud so this method is used to reduce to volume/amp
  backGroundSound.amp(.5);
  
  jumpSound = new SoundFile(this, "RopeSwooshSoundEffect.wav");
  //https://www.youtube.com/watch?v=1zjIJrBKWd4
  
  vaseBreakSound = new SoundFile(this, "VaseBreakingSoundEffect.wav");
  //https://www.youtube.com/watch?v=Dc1cN7FE-pk
  
  bombSound = new SoundFile(this, "BombSoundEffect.wav");
  //https://www.youtube.com/watch?v=6P8ZXtBPmYk
  
  swordSound = new SoundFile(this, "SwordSlashSound.wav");*/
  //https://www.youtube.com/watch?v=X3liPsg21Cg
  
  initializeVariables();
  size(830,830);
  
  felix = createFont("FELIXTI.TTF", 130);
  calibri = createFont("calibri.ttf", 100);
  
  //load heart image
  //http://clipartfreefor.com/cliparts/files/trim-clipart-pink-valentine-hearts-clip-art-i9.png
  heart = loadImage("lifeHeart.png");

  
  dart = loadImage("RopeDart.png");
  //https://www.google.com/search?q=spear+hook&rlz=1C1CHFX_enUS678US678&espv=2&biw=1280&bih=595&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjNqKHiobDMAhXJdT4KHQQMD0MQ_AUIBygC#tbm=isch&q=rope+dart+assassin%27s+creed+3&imgrc=tWPUV07Pyz_lxM%3A
  
  pauseScreen = loadImage("PauseScreen.png");
  
  winScreen = loadImage("winScreen.jpg");
  //http://thumb1.shutterstock.com/display_pic_with_logo/265489/308445770/stock-vector-meditating-cartoon-ninja-vector-clip-art-illustration-with-simple-gradients-ninja-and-mask-s-308445770.jpg
  
  gameOverScreen = loadImage("gameOver.jpg");
  //http://comps.canstockphoto.com/can-stock-photo_csp18259116.jpg
  
  dojoBG = loadImage("DojoBack.png");
  //https://topwallpapers.pw/fun/dojo-exploitable-there-fun-to-be-had-with-desktop-hd-wallpaper-1262328/
  
  jumpInstruct = loadImage("jumpInstruct.png");
  //http://www.spartacus-technologies.com/ksv/public/icons/left_click.png
  
  attackInstruct = loadImage("attackInstruct.png");
  //http://www.iconpng.com/png/computer-and-media-1/right38.png
    
  //vases
  vase[0] = loadImage("BlueVase.png");
  vase[1] = loadImage("BlueVaseBroken.png");
  vase[2] = loadImage("BlueVaseBroken2.png");
  vase[3] = loadImage("BlueVaseBroken3.png");
  vase[4] = loadImage("BlueVaseBroken4.png");
  //http://comps.canstockphoto.com/can-stock-photo_csp13002945.jpg
  
  //explosion
  explosion[0] = loadImage("explosion1.png");
  explosion[1] = loadImage("explosion2.png");
  explosion[2] = loadImage("explosion3.png");
  explosion[3] = loadImage("explosion4.png");
  //http://s678.photobucket.com/user/GameGuysProjects/media/explosion.png.html
  
  //ninja resting
  ninja[0] = loadImage("NinjaResting1.png");
  ninja[1] = loadImage("NinjaResting2.png");
  ninja[2] = loadImage("NinjaResting3.png");
  
  //ninja running
  ninja[3] = loadImage("NinjaRun1.png");
  ninja[4] = loadImage("NinjaRun2.png");
  ninja[5] = loadImage("NinjaRun3.png");
  ninja[6] = loadImage("NinjaRun4.png");
  ninja[7] = loadImage("NinjaRun5.png");
  ninja[8] = loadImage("NinjaRun6.png");
  
  //ninja jumping
  ninja[9] = loadImage("NinJump1.png");
  ninja[10] = loadImage("NinJump2.png");
  ninja[11] = loadImage("NinJump3.png");
  ninja[12] = loadImage("NinJump4.png");
  ninja[13] = loadImage("NinJump5.png");
  //https://image-gr.s3.envato.com/files/115782948/Ninja%20Sprites.jpg
  
  //ninja sword
  ninja[14] = loadImage("NinjaSword1.png");
  ninja[15] = loadImage("NinjaSword2.png");
  ninja[16] = loadImage("NinjaSword3.png");
  ninja[17] = loadImage("NinjaSword4.png");
  //http://image.shutterstock.com/z/stock-vector-animation-of-ninja-attacking-with-sword-vector-clip-art-illustration-with-simple-gradients-each-253483645.jpg
  
 
  
}

//I used this method to initialize variables so it can also be called whenever everything needs to be reset.
void initializeVariables(){
  
  num1 = (int)random(1, 5);
  num2 = (int)random(1, 5);
  level = 1;
  
  result = num1 + num2;
  playerX = 100;
  playerY = 520;
  playerSpeed = 18;
  
  vasePassCounter = 0;
  instructionsTimer = 0;
  
  playerFrame = 0;
  explosionFrame = 0;
  wrongVaseBroken = false;
  
  frameRate(15);
  gravity = 22;
  restMovement = 0;
  vaseBreaker = 0;
  backgroundX = 0;
  heartX = 15;
  helpStep = 0;
  
  jumped = false;
  sliced = false;
  vaseBroken = false;
  helpStepChanged = false;
  
  score = 0;
  streak = 0;
  
  lives = 3;
  vaseNumber = (int)random(result, ((result)+2) );
  vaseX = 600;
  
  gameState = 0;
  jumpCounter = 0;

}


void draw(){
  
  
  //backround rectangle
  fill(255,255, 245);
  noStroke();
  rect(0, 260, 830, 130);
  
  //draw background
  if(backgroundX <= 0){
  image(dojoBG, backgroundX + 830, 0);}
  
  image(dojoBG, backgroundX, 0);
  
  //loops the background image
  if(backgroundX < -830){
  backgroundX = 0;
  }
  
  //draw vase
  image(vase[vaseBreaker], vaseX, 500);
  
  
  
noStroke();
//this is where the game screens are changed according to the game state variable
if(gameState == 0){
menuState();}
if(gameState == 1){
playState();
}

if(gameState == 2){
helpState();}

//draw ninja
//this is to make the ninja flicker in and out if there is an explosion
if(explosionFrame == 0 || explosionFrame == 3){
image(ninja[playerFrame], playerX, playerY);}

if(gameState == 3){
pauseState();
}
if(gameState == 4){
gameOverState();
}
if(gameState == 5){
winState();
}

}

//the default state of the game
void menuState(){

  playerRest();
  //draws a rectangle where the play and help options can be drawn
  rect(316, 300, 203, 278);
  fill(0);
  
  //Ttile
  textFont(felix);
  text("Math Ninja", 30, 375);
  
  //highlights the play button
  if(mouseX > 335 && mouseX < 510 && mouseY> 420 && mouseY < 480){
    
  fill(230,0,0);
  if(mousePressed == true){
    gameState = 1;
  }
  
  }
  textFont(calibri);
  textSize(90);
  text("PLAY", 335, 480);
  
  //highlights the help button
  if(mouseX > 345 && mouseX < 490 && mouseY> 500 && mouseY < 560){
    
  fill(230,0,0);
  if(mousePressed == true){
    gameState = 2;
    helpStep = 0;
  }
  }else{
  fill(0);}
  textSize(70);
  text("HELP", 345, 550);
  fill(255, 255, 230);
  textSize(27);
  text("Created by Bedir Aygun", 550, 800);
  
}

void playState(){
  
  //this displays basic instructions for the game at the beginning as long as the timer is within a certain range
  instructionsTimer ++;
  if(instructionsTimer < 100){
   image(jumpInstruct, 50, 600);
   text("Jump", 120, 750);
   image(attackInstruct, 700 ,600);
   text("Attack", 550, 750);
  }
  
  //gives the pause option through keyboard input
  if(keyPressed == true && (key == 'p' || key == 'P')){
   gameState = 3;
  }
  if(mouseX >= 730 && mouseX <= 805 && mouseY >= 20 && mouseY <= 45 ){
    fill(0, 255, 0);
    if(mousePressed == true){
    gameState = 3;}
  }
  textSize(25);
  text("(P)ause", 730, 40);
  
  fill(255);
  math();
  playerMovement();
  
  //draws hearts
  for(heartX = 15; heartX < ((lives*35)+15); heartX +=35){
  
    image(heart, heartX, 15);
    
  }
  randomizeAnswers();
  
}

//this is so that players can pause and resume the game or return to the menu
void pauseState(){
  
  //this is a transparent image that shows the current state of the game
  image(pauseScreen, 0, 0);
  textSize(150);
  fill(0);
  text("Paused", 190, 370);
  
  
  //highlights and gives the option of resuming by either pressing r or clicking on it
  if(keyPressed == true && (key == 'R' || key == 'r')){
  gameState = 1;
  }
  if(mouseX > 290 && mouseX < 480 && mouseY > 405 && mouseY < 445){
    fill(255, 0, 0);
    if(mousePressed == true){
    gameState = 1;
    }
  }else{
  fill(0);
  }
  
  textSize(50);
  text("(R)esume", 290, 440);
  
  //this highlights and gives the option of going to the menu by either pressing m or clicking on it
  if(keyPressed == true && (key == 'M' || key == 'm')){
  initializeVariables();
  }
  if(mouseX > 310 && mouseX < 450 && mouseY > 465 && mouseY < 505){
    fill(255, 0, 0);
    if(mousePressed == true){
    initializeVariables();
    }
  }else{
  fill(0);
  }
  text("(M)enu", 310, 500);

//rect(290, 400, 190, 50);

}
//this appears once the lives are equal to 0
void gameOverState(){
  
  image(gameOverScreen, 0, 0);
  
  textSize(50);
  fill(255, 0, 0);
  //displays the players score
  text("Your Score:  " + score, 240, 700);
  
  
  //if the m button is pressed or clicked on, it calls the initializeVariables method which resets everything.
  if(keyPressed == true && (key == 'M' || key == 'm')){
  initializeVariables();
  }
  if(mouseX > 330 && mouseX < 470 && mouseY > 735 && mouseY < 775){
    fill(0, 0, 255);
    if(mousePressed == true){
    initializeVariables();
    }
  }else{
  fill(0);
  }
  text("(M)enu", 330, 770);
}

//this comes up once the player has beat level 5 with a streak of 5
void winState(){
  
  image(winScreen, 0, 0);
  
  textSize(50);
  fill(0);
  text("Your Score:  " + score, 240, 670);
  
  //gives the option of freeplay or continuing to play
  if(keyPressed == true && (key == 'F' || key == 'f')){
  gameState = 1;
  }
  if(mouseX > 280 && mouseX < 510 && mouseY > 700 && mouseY < 735){
    fill(255, 0, 0);
    if(mousePressed == true){
    gameState = 1;
    }
  }else{
  fill(0);
  }
  
  textSize(50);
  text("(F)reePlay", 280, 730);
  
  //returns to the menu
  if(keyPressed == true && (key == 'M' || key == 'm')){
  initializeVariables();
  }
  if(mouseX > 310 && mouseX < 450 && mouseY > 760 && mouseY < 795){
    fill(255, 0, 0);
    if(mousePressed == true){
    initializeVariables();
    }
  }else{
  fill(0);
  }
  text("(M)enu", 310, 790);
}


//this is a method to help better randomize the answers, have the answer show up more often, and prevent repetition
void randomizeAnswers(){
  
  if(vaseX < -100){
  vaseX = 830;
  vasePassCounter = (byte)random(1,5);
  
  if(vasePassCounter == 1){
  vaseNumber = (int)random((result - 2), (result+10));
  }else
  if(vasePassCounter == 2){
  vaseNumber = result;
  }else
  if(vasePassCounter == 3){
  vaseNumber = (int)random(result, (result+5));
  //vasePassCounter = 0;
  }
  vaseBreaker = 0;
  explosionFrame = 0;
  if(vasePassCounter == 4){
  vaseNumber = result;
  }
  if(vasePassCounter == 5){
  vaseNumber = result;
  }
  }
  
}

//this is to change the range of numbers on each level
void randomizeNums(){

  if(level == 1){
    num1 = (int)random(1, 5);
    num2 = (int)random(1, 5);
  }
  if(level == 2){
    num1 = (int)random(3, 10);
    num2 = (int)random(3, 10);
  }
  if(level == 3){
    num1 = (int)random(7, 15);
    num2 = (int)random(7, 15);
  }
  if(level == 4){
    num1 = (int)random(11, 20);
    num2 = (int)random(11, 20);
  }
  if(level == 5){
    num1 = (int)random(2, 25);
    num2 = (int)random(2, 25);
  }
  if(level == 6){
    num1 = (int)random(1, 50);
    num2 = (int)random(1, 50);
  }
}

//math is where most of the logic and mechanics of the game take place
void math(){
  
  //this shows the score, streak and level
  textSize(40);
  text("Score: " + score, 20, 80);
  text("Streak: " + streak, 20, 120);
  if(level < 6){
  text("Level " + level, 340, 40);
  }
  if(level == 6){
  text("Free Play", 330, 40);
  }
  //keeps the score counting as long as the game runs
  score++;
  
  //if the player dies, the game state is changed to the game over state
  if(lives == 0){
  gameState = 4;
  }
  
  //this is to ensure that when the player hits through the vase, he is penalized
  if(/*mousePressed == false && keyPressed == false && */(playerX + 50) > vaseX && (playerX - 10)< vaseX && playerY > 340){
  if(vaseBreaker < 4){
    vaseBreaker ++;
    vaseBroken = true;
      
      }
  }
  //this is to draw the explosion on the wrong vase or if the player runs into the vase
  if(wrongVaseBroken == true && explosionFrame < 3){
    image(explosion[explosionFrame], vaseX - 10, 500);
    explosionFrame ++;
    if(explosionFrame == 3){
    wrongVaseBroken = false;
    }
  }
  
  //this increases the level once you hit a streak of 5
  if(streak == 5 && level == 1){
  level = 2;
  lives ++;
  streak = 0;
  playerSpeed = 20;
  randomizeNums();
  }
  if(streak == 5 && level == 2){
  level = 3;
  lives ++;
  playerSpeed = 22;
  streak = 0;
  randomizeNums();
  }
  if(streak == 5 && level == 3){
  level = 4;
  lives ++;
  streak = 0;
  playerSpeed = 22;
  randomizeNums();
  }
  if(streak == 5 && level == 4){
  level = 5;
  lives ++;
  streak = 0;
  playerSpeed = 22;
  randomizeNums();
  }
  if(streak == 5 && level == 5){
  lives ++;
  playerSpeed = 24;
  gameState = 5;
  level = 6;
  randomizeNums();
  
  }
  
  //this brings the speed up after the wrong answer
  if(playerSpeed < 18){
  playerSpeed ++;
  }
  
  //text for the equation
  fill(0,0,0);
  textSize(100);
  
  result = num1 + num2;
  
  //if num1 has more than 1 digit, this makes sure the text is centered
  if(num1 >= 10){
  text(num1+"+"+num2, 250, 360);}
  if(num1 < 10){
  text(num1+"+"+num2, 310, 360);
  }
  
  //vase text
  fill(255, 255, 255);
  textSize(50);
  if(vaseBreaker == 0){
  //draws the vase number if it is not broken and makes sure it is centered
  if(vaseNumber < 10){
  text(vaseNumber, (vaseX+35), 610);
  }
  if(vaseNumber > 9 && vaseNumber < 100){
  text(vaseNumber, (vaseX+25), 610);
  }
  if(vaseNumber > 99){
  text(vaseNumber, (vaseX+13), 610);
  }}
  if(vaseBroken == true && vaseBreaker == 1){
    if(vaseNumber == result && (mousePressed == true || keyPressed == true)){
    score += (50*(streak + 1));
    streak ++;
    playerSpeed += 2;
    randomizeNums();
    //vaseBreakSound.play();
    //vaseBroken = false;
    }
    
    //if the player gets the answer wrong, it resets the streak, the speed and decreases a life
    if(vaseNumber != result ||(mousePressed == false && keyPressed == false)){
    streak = 0;
    playerSpeed = 10;
    lives --;
    wrongVaseBroken = true;
    //bombSound.play();
    vaseBroken = false;
    }
  }
}

//draws the player at rest for the menu screen
void playerRest(){
  
  //Resting
    if(playerFrame > 2){ 
    playerFrame = 0;}
    
    if(playerFrame == 0){
      restMovement = 1;
    }if(playerFrame == 2){
      restMovement = -1;
    }
    playerFrame += restMovement;
  
}

//this method is for the players movements
void playerMovement(){
  
  //player running
  backgroundX -= playerSpeed;
  vaseX -= playerSpeed;
  
  if(jumped == false && sliced == false){
  if(playerFrame <= 7){
  playerFrame ++;
     
  }else if(playerFrame >= 8){
  playerFrame = 3;
  }
  }
  
  //bring player back after jump
  if(playerY == 520 && playerX > 100){
  playerX -= 5;
  }
  
  //Gravity
  //makes the player come down after a jump
  if(playerY < 520){
  playerY += gravity;
  if(jumped == false){
    playerFrame = 11;
  
  }
  if(playerFrame >= 11 && playerFrame <= 12){
      playerFrame ++;
      }
  }

  
      
     //call the jump method
     playerJump();
      
     //this ensures that when there is no input, none of the methods are turned on
     if(keyPressed == false && mousePressed == false){
     jumped = false;
     jumpCounter = 0;
     sliced = false;
     }
      
     //call the sword attack method
     swordAttack();
      
    }
    
//controls the sword attack
void swordAttack(){
  
  //gives the option of space, right or right mouse button to attck
  if((keyPressed == true && (key == ' ' || keyCode == RIGHT))||(mousePressed == true && mouseButton == RIGHT) && playerY >= 520){
      sliced = true;
      if(playerFrame < 12){ 
      playerFrame = 13;

     
    }
    
      if(playerFrame == 13){
     //swordSound.play();
    }
      
      if(playerFrame < 16){
      playerFrame ++;
       
      }
     
      //this is when the sword hits the vase
      if(playerX + 170 >= vaseX && playerX <= vaseX){
      if(vaseBreaker < 4){
      vaseBreaker ++;
      vaseBroken = true;
      }}
    }
}

//this defines the playerjump method to be used to recieve input and make the player jump
void playerJump(){
    //these actions only take place if this criteria is met
    if(keyPressed == true){
      //this gives the option of using multiple different keys to jump
      //this is the keyboard input 
      if(keyCode == UP || key == 'w' || key == 'W'){
        //this sets the jumped variable to true and sets off the animation and jump 
        jumped = true;
        
        //puts the player slightly forward to help him jump over the vase
        playerX = 150;
        jumpCounter ++;
       
      }}
      //this gives the mouse input option
      if(mousePressed == true){
      //the left mouse button will be used for jumping
      if(mouseButton == LEFT){
         jumped = true;
         playerX = 150;
         jumpCounter ++;
      }}
      if(jumpCounter >= 20){
        jumped = false;
        }
       if(jumped == true && playerY <= 540 && playerY >= 400){
        
       //jumpSound.play();
       
      }

        while(jumped == true && playerY > 320){
         
         //if the frame is less than 8, set it to 8 to start the jump animation
         if(playerFrame < 8){
           playerFrame = 8;
  
          }
          //once the frame is 8, increase the frame by one until the frame is 11
          if(playerFrame <= 10){
          playerFrame ++;
          }
          
          // decreases the players Y position incrementally until it gets to 320
          playerY -= 2;
          
          //rope dart
          //since the rope dart is based on the x coordinate of the vase, as long as the vase is on the screen draw the rope dart
          if(vaseX > -100){
          //draws the dart ahead of the vase on the top of the screen
          image(dart, vaseX + 100, 45);
          //the rope thickness
          strokeWeight(5);
          //the rope color is black
          stroke(0);
          //this draws the rope
          line(vaseX + 100, 120, 250, 420);}
      }
     

}

//I used this method because this seems to be the only way to get the mouse click to register once.
void mouseClicked(){
  //goes to the next step
  if(mouseX >= 715 && mouseX <= 780 && mouseY >= 730 && mouseY <= 800 && helpStep < 5){
  helpStep++;
  vaseBreaker = 0;
  if(helpStep == 4){
  vaseX = 600;
  }
  }
  if(mouseX >= 50 && mouseX <= 115 && mouseY >= 730 && mouseY <= 800 && helpStep > 0){
  helpStep --;
  }
}

//this is when the help button is clicked on the menu, it gives a little intro and some useful information
void helpState(){
  textSize(50);
  
  //next step
  if(keyPressed == true && keyCode == RIGHT && helpStepChanged == false && helpStep < 5){
    helpStepChanged = true;
    helpStep++;
    vaseBreaker = 0;
    if(helpStep == 4){
      vaseX = 600;}
    }

  
  //back step
  if(keyPressed == true && keyCode == LEFT && helpStep > 0 && helpStepChanged == false){
    helpStepChanged = true;
    helpStep --;
  }
  //to ensure multiple steps don't change at once
  if(keyPressed == false){
    helpStepChanged = false;
  }
  
  if(keyPressed == true && (key == 'M' || key == 'm')){
  initializeVariables();
  }
  if(mouseX > 320 && mouseX < 470 && mouseY > 770 && mouseY < 810){
    fill(0, 255, 0);
    if(mousePressed == true){
    initializeVariables();
    }
  }else{
  fill(255);
  }
  text("(M)enu", 320, 810);
 
  textSize(50);
  //turns the next button green when you hover over it
  if(mouseX >= 715 && mouseX <= 780 && mouseY >= 730 && mouseY <= 800 && helpStep < 5){
  fill(0, 255, 0);
  }else{
  //turns the button back to white when the mouse is not hovering it
  fill(255, 255, 240);}
  
  strokeWeight(2);
  stroke(0);
  //writes the next word under the next arrow
  if(helpStep < 5){
  text("Next", 700, 800);
  triangle(750, 720, 750, 770, 780, 745);
  rect(715, 735, 35, 20);
  }
  
  //turns the back button green when you hover over it
  if(mouseX >= 50 && mouseX <= 115 && mouseY >= 730 && mouseY <= 800 && helpStep > 0){
  fill(0, 255, 0);
  }else{
  fill(255, 255, 240);}
  if(helpStep > 0){
  triangle(80, 720, 80, 770, 50, 745);
  rect(80, 735, 35, 20);
  text("Back", 40, 800);
  }
  
  
  //the steps each have a corresponding helpStep value
  if(helpStep == 0){
  //this is to ensure that the player and vase position are in the correct position each time
  playerX = 100;
  playerY = 520;
  vaseX = 600;
  
  fill(255);
  textSize(40);
  text("This is Ido Mat,", 75, 680);
  text("the math ninja", 80, 720);
  }
  
  if(helpStep == 1){
  
  playerX = 100;
  playerY = 520;
  vaseX = 600;
  
  fill(0);
  textSize(100);
  text("1 + 1", 320, 360);
  
  fill(255);
  textSize(40);
  text("Problems are displayed on the dojo's window", 40, 690);
  
  }
  
  if(helpStep == 2){
  vaseBreaker = 0;
  playerX = 100;
  playerY = 520;
  vaseX = 600;
  fill(0);
  textSize(100);
  text("1 + 1", 300, 360);
  
  fill(255);
  textSize(40);
  text("Answers are displayed on the vases", 100, 690);
  
  fill(255);
  textSize(50);
  text("2", (vaseX+35), 610);
  }
  
  if(helpStep == 3){
  playerX = 100;
  playerY = 520;
  vaseX = 270;
  fill(0);
  textSize(100);
  text("1 + 1", 300, 360);
  
  fill(255);
  textSize(50);
  if(vaseBreaker == 0){
  text("2", (vaseX+35), 610);}
  
  fill(255);
  textSize(35);
  text("Use SPACE, RIGHT or the Right Mouse Button to break", 40, 690);
  text("the vase with the correct answer", 190, 725);
  
   if(mouseButton == RIGHT || (keyPressed == true && key == ' ')){
      swordAttack();
      }
  if(mousePressed == false && keyPressed == false){
  playerFrame = 0;
  }
  }
  if(helpStep == 4){
  fill(0);
  textSize(100);
  text("1 + 1", 300, 360);
  
  fill(255);
  textSize(50);
  text("3", (vaseX+35), 610);
  
  fill(255);
  textSize(35);
  text("W, UP or the Left Mouse Button to use your rope dart", 30, 690);
  text("to avoid the vase with the incorrect answer", 110, 725);
  
 //calls the movement method to demonstrate jumping
 playerMovement();
 }
 if(helpStep == 5){
    
  playerFrame = 0;
  playerX = 100;
  playerY = 520;
  vaseX = 600;
  //draws the hearts
  for(heartX = 15; heartX < ((lives*35)+15); heartX +=35){
  
    image(heart, heartX, 15);
    
  }
  fill(255);
  textSize(40);
  text("Score: 842", 20, 80);
  text("Streak: 3", 20, 120);
  text("At the top of the screen your lives, score, streak", 30, 690);
  text("and level are displayed", 220, 725);
  }
}