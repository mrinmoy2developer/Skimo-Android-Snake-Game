int pscore,highscore;
void startscreen(){
  noStroke();
  clear();
  //fill(#27FC39);
  button(About_us,displayWidth-displayWidth/10-displayWidth/3,displayHeight/1.5+displayWidth/3-20,displayWidth/3,displayHeight/8+50,6);
  button(Settings,displayWidth-displayWidth/10-displayWidth/3,displayHeight/1.5-20,displayWidth/3,displayHeight/8+20,5);
  image(Logo,displayWidth/8.2,displayHeight/10,displayWidth/1.2,displayHeight/1.8);
  button(Play,displayWidth/10,displayHeight/1.5,displayWidth/3+50,displayHeight/8,1);
  button(High_score,displayWidth/10,displayHeight/1.5+displayWidth/3-20,displayWidth/3,displayHeight/8+50,7);
  button(Exit,displayWidth-200,120.0,200.0,100.0,0);
  //fill(0,0,0);
 // text("About Us",displayWidth-displayWidth/10-displayWidth/3,displayHeight/1.5+displayWidth/3+50,displayWidth/3,displayHeight/8);
  fill(#FF760B);
  rect(10,50,150,50);
  fill(0,0,0);
  textSize(40);
  textAlign(LEFT);
  text("Player:",20,60,150,50);
  rect(150,50,500,50);
  fill(#FF760B);
  text(buffer,160,60,500,50);
  
}

void gamescreen(){
  
  frameRate(fr);
  if(state==1){
    clear();
     S=new snake(color(SR,SG,SB),3,6);
     t=S.score;
     l=S.life;
     b=S.bombs;
     fr=6;
  state=2;
  KetaiAlertDialog.popup(this,"Be Ware of Hidden Mines!","To make the game difficult and more interesting invisible mines have been placed in random places which when hit will affect the snake's health and ultimately may kill it!");
  }
  
  button(Pause,displayWidth-150, displayHeight-150,100,100,9);
  if(second()==30||second()==59)fr+=0.069;
  //image(Apple,310,45,70,60);
  //image(Life,658,45,70,60);
  image(Apple,displayWidth/20+displayWidth/2.5,displayWidth/30,displayWidth/10,displayWidth/10);
  image(Life,displayWidth/20+displayWidth*5/6,displayWidth/30,displayWidth/10,displayWidth/10);
  image(Bomb,displayWidth/20+displayWidth/2.3,displayHeight-displayWidth/7,displayWidth/10,displayWidth/10);
  
  smooth();
  //randomSeed(millis());
  //ax=int(random(0,X));
  //ay=int(random(0,Y));
  //image(apple,ax,ay,sw,sw);
  textAlign(LEFT);
  
  textSize(45);
  if(t!=S.score||l!=S.life){
  fill(bkd);
  noStroke();
  rect(displayWidth/20,displayWidth/20,displayWidth,displayWidth/10);
  t=S.score;
  l=S.life;
  }
  if(b!=S.bombs){
    fill(bkd);
    noStroke();
  rect(displayWidth/20,displayHeight-displayWidth/9,displayWidth,displayWidth/9);
  b=S.bombs;
  }
  fill(#FF5903);
  textSize(60);
  text("SCORE:-"+nf(S.score,2,0),displayWidth/20,displayWidth/20,displayWidth/2.5,displayWidth/6);
  //text("LIFE:-"+nf(S.life,2,0),450,50,300,200);
  text("LIFE:-"+nf(S.life,2,0),displayWidth/20+displayWidth*2/3-displayWidth/8,displayWidth/20,displayWidth/3,displayWidth/6);
  text("BOMBS:-"+nf(S.bombs,2,0),displayWidth/20,displayHeight-displayWidth/9,displayWidth,displayWidth/9);
  
    if(S.life<0)
  {state=3;pscore=S.score;clear();
  }
  else {S.update();}
}
void gameoverscreen(){
  float x1=displayWidth/2-75;
  float x2=x1+500;
  float y1=displayHeight*3/4+displayWidth/20;
  float y2=y1+500;
  fill(#FFD702);
  textAlign(CENTER);
  textSize(50);
  db.query("SELECT MAX(score) FROM Highscore");
  if(db.next())
  text("Global High Score:"+nf(highscore=db.getInt("MAX(score)"),2,0),0,displayHeight/5-200,displayWidth,200);
  
  db.query("SELECT score FROM Highscore WHERE name='"+buffer+"'");
  if(db.next())
  text("Your High Score:"+nf(highscore=db.getInt("score"),2,0),0,displayHeight/5-100,displayWidth,200);
  
  text("You Scored:"+nf(pscore,2,0),0,displayHeight/5,displayWidth,200);
  //imageMode(CENTER);
  
  
  image(gameover,displayWidth/2-displayWidth/2.2,displayHeight/4,displayWidth/1.1,displayHeight/2);
  
 // S.hide();S.apple.hide(bkd);
 //println(displayWidth/6-mouseX,displayHeight/4-mouseY);
  button(Replay,x1,y1,150,150,0);
  }

void clear(){
  background (bkd);
}