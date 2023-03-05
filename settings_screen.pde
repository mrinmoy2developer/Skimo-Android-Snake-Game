boolean change=false,drop=false;
void setting(){
  background (bkd);
  int sp=100,top=300;
  //fill(bkd);
  //stroke(0,0,0);
  //strokeWeight(20);
  //rect(displayWidth/1.19+50,50,50,50);
  smooth ();
  BR=scroll_bar(BR,50,top+sp,"R:-");
  BG=scroll_bar(BG,50,top+2*sp,"G:-");
  textAlign(CENTER);
  text("Settings:-",0,20,displayWidth,70);
  BB=scroll_bar(BB,50,top+3*sp,"B:-");
  bkd=color(BR,BG,BB);
  text("Background Colour:-",50,top,displayWidth,50);
  text("Snake Colour:-",50,top+4*sp,displayWidth,50);
  fill(SR,SG,SB);
  strokeWeight(10);
  stroke(0,0,0);
  rect(displayWidth/1.3,top+4*sp,100,80);
  SR=scroll_bar(SR,50,top+5*sp,"R:-");
  SG=scroll_bar(SG,50,top+6*sp,"G:-");
  SB=scroll_bar(SB,50,top+7*sp,"B:-");
  
  textAlign(LEFT);
  text("Player Name:-",50,top+8*sp,displayWidth-50,50);
  stroke(255,255,255);
  rect(50,top+9*sp,displayWidth-100,70);
  fill(#B515FF);
  
  
  
  
  stroke(0,0,0);
  strokeWeight(10);
  rect(50,top+9*sp,120,70);
  button(Keyboard,60,top+9*sp+10,100,50,4);
  caller=5;
  fill(0,0,0);
  
  text(buffer,180,top+9*sp+10,displayWidth-160,50);
  fill(#135CF5);
  rect(50,displayHeight-150,displayWidth/4,80);
  rect(displayWidth*3/4-50,displayHeight-150,displayWidth/4,80);
  fill(255,255,255);
  textAlign(CENTER);
  button("Apply",50,displayHeight-150+15,displayWidth/4,100,0);
  button("Cancel",displayWidth*3/4-50,displayHeight-150+15,displayWidth/4,100,0);
  fill(255,255,255);
  text("Theme:-",50,100,displayWidth-100,50);
  droplist(theme,50,100+sp,displayWidth-100,50);
  
   // buffer="\0";
 // 
}
void droplist(String s,float x,float y,float w,float h){
  fill(255,255,255);
  stroke(0,0,0);
  y-=30;
  h+=30;
  rect(x,y,w,h);
  fill(0,0,0);
  triangle(x+w,y+h,x+w-20,y+h,x+w,y+h-20);
  text(s,x,y+15,w,h);
  if(mousePressed)
    if(mouseX<x+w&&mouseX>x&&mouseY<y+h&&mouseY>y&&time!=second()){drop=!drop;time=second();}
    if(drop){
      int n=0;
      db.query("SELECT DISTINCT COUNT(theme) FROM Settings");
     while(db.next())n=db.getInt("COUNT(theme)");
      fill(255,255,255);
     strokeWeight(10);
      rect(x,y+h,w,h*n-h);
      i=0;
      db.query("SELECT DISTINCT theme FROM Settings");
      while(db.next()){
        fill(255,255,255);
        rect(x,y+h+i*h,w,h);
        fill(0,0,0);
        button(db.getString("theme"),x,y+h+i*h+10,w,h,5);
        i++;
        }
      
      
    }
    
  }
  
