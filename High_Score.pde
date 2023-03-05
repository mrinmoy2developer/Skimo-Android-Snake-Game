
Boolean b1=true;
float y1=100,gy=100,gx=300,sp=50;
void HighScore(){
  background(#2BFB3C);
 // textFont(f2);
  fill(0,0,255);
  textSize(48);
  //image(Scoreboard,10,10,displayWidth-10,displayHeight-10);
  textAlign(LEFT);
  button(Back,40,displayHeight-140,100,100,0);
  text("Rank:-",5,50,gx,gy);
  text("______",5,55,gx,gy);
  text("Player Name:-",145,50,500,gy);
  text("_____________",145,55,500,gy);
  text("High Score:-",455,50,300,gy);
  text("____________",455,55,300,gy);
  //text("Player Name:-",gx,y1,gx,gy);
  //text("High Score:-",gx*2,y1,gx,gy);
  //text("Last Played:-",gx*3,y1,gx,gy);
  i=0;b1=true;
  db.query("SELECT name,score FROM Highscore ORDER BY score DESC");
  while(db.next()){
    i++;
  if(b1){fill(#3BE5FD);b1=false;}
  else {fill(#1C62F8);b1=true;}
  rect(10,y1+sp*i-5,displayWidth-20,gy-50);
  if(i==1)fill(255,0,0);
  else fill(0,0,0);
  text(nf(i,0,0),30,y1+sp*i,100,gy);
  text(db.getString("name"),150,y1+sp*i,500,gy);
  text(nf(db.getInt("score"),2,2),520,y1+sp*i,100,gy);
  if(i<3)image(Medals[i],70,y1+sp*i-5,50,50);
  else if(i==3)image(Medals[i],33,y1+sp*i-8,130,60);
 
  }
}