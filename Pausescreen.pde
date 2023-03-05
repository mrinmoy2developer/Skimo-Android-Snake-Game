boolean jo=true;
String[] menu={"Main Menu","Replay","High Score","About Us","Exit"};
int[] menukey={0,1,7,6,100};
void paused(){
   fill(255,255,255,50);
   if(jo){rect(0,0,displayWidth,displayHeight);jo=false;}
   if(button(Resume,displayWidth-150, displayHeight-150,100,100,2))jo=true;
   fill(255,0,0);
   textSize(30);
   if(time!=second()){
   image(UpArrow,displayWidth/20+displayWidth/2.5-50,displayWidth/30+70,100,100);
   text("Your Current Score",displayWidth/20+displayWidth/2.5-50-180,displayWidth/30+70+50,200,100);
  image(UpArrow,displayWidth/20+displayWidth*5/6-50,displayWidth/30+70,100,100);
  text("Number of lives left",displayWidth/20+displayWidth*5/6-50-170,displayWidth/30+70+50,200,100);
  image(DownArrow,displayWidth/20+displayWidth/2.3-50,displayHeight-displayWidth/7-100,100,100);
  text("Number of mines left to discover",displayWidth/20+displayWidth/2.3-50-200,displayHeight-displayWidth/7-100-50,200,200);
  image(DownArrow,displayWidth-150-50, displayHeight-150-100,100,100);
  text("Click here to resume",displayWidth-150-50-170, displayHeight-150-100-50,200,100);}
   for(int i=0;i<5;i++){
     textSize(63);
     fill(#16B2FF);
     stroke(0,0,0);
     strokeCap(ROUND);
     smooth(50);
     strokeWeight(15);
     rect(displayWidth/4,displayHeight/5+i*150,displayWidth/2,100);
     fill(#3400F8);
     textAlign(CENTER);
     button(menu[i],displayWidth/4,displayHeight/5+i*150+20,displayWidth/2,100,menukey[i]);
   }
   noStroke();
   if(state==2)clear();
}