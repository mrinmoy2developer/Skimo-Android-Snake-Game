
boolean d=true;
class cell{
  int x,y;
  color c;
  cell(int a,int b, color d){
    x=a;y=b;c=d;
  }

  void show(){
    fill(c);
    rect(x*(sw+gw),y*(sw+gw),sw,sw);
  }
  void hide(color k){
    noStroke();
    fill(k);
    rect(x*(sw+gw),y*(sw+gw),sw,sw);
  }
};
boolean button(PImage I,float x,float y,float w,float h,int s){
  image(I,x,y,w,h);
  if(mousePressed){
   float x1=x;
   float x2=x+w;
   float y1=y;
   float y2=y+h;
    if(mouseX>x1&&mouseX<x2&&mouseY>y1&&mouseY<y2&&abs(time-second())>0){
      if(I==Exit)
    System.exit(0);
    if(I==Settings)change=false;
    if(I==Replay&&highscore<pscore&&d){d=false;
      KetaiAlertDialog.popup(this,"We salute you!","Well done you just broke your own previous records!");
      if(!db.execute("UPDATE Highscore  SET score="+pscore+" WHERE name = '"+buffer+"'"))
      KetaiAlertDialog.popup(this,"Failed!","Sorry we failed to save the player name to secondary storage.Make sure the app has required storage access and try again!");
      else {if(highscore<pscore)
  KetaiAlertDialog.popup(this,"Congratulations!","You made a new record!You crossed the global highscore!");
        
      }
    }
    state=s;shake();
    time=second();
    
    clear();return true;}
  }
  
  return false;
}
boolean button(String I,float x,float y,float w,float h,int s){
  text(I,x,y,w,h);
  
  if(mousePressed){
    
   float x1=x;
   float x2=x+w;
   float y1=y;
   float y2=y+h;
    if(mouseX>x1&&mouseX<x2&&mouseY>y1&&mouseY<y2&&abs(time-second())>0){
    state=s;shake();
    if(I=="Apply"){
      if(!db.execute("INSERT INTO Highscore(name) VALUES ('"+buffer+"')"))
      KetaiAlertDialog.popup(this,"Failed!","Sorry we failed to save the player name to secondary storage.Make sure the app has required storage access and try again!");
     // if(!db.execute("INSERT INTO High_score(date) VALUES ('"+year()+"-"+month()+"-"+day()+"')"))
     // KetaiAlertDialog.popup(this,"Failed!","Sorry we failed to access the current system time and date.Try again!");
     if(change){
     KetaiAlertDialog.popup(this,"Custom Theme!","Please enter a name of the theme to save it!");
     state=10;caller=0;buffer=theme;}
     
      pSG=SG;pSR=SR;pSB=SB;
      pBB=BB;pBG=BG;pBR=BR;
    }
    else if(I=="Cancel"){
      change=false;
      if(!db.query("SELECT name FROM Highscore ORDER by id DESC LIMIT 1"))
    KetaiAlertDialog.popup(this,"Failed to Execute!","Sorry the application failed to load the Name of tge Player!Try again!");
    if(db.next())
    buffer=db.getString("name");
    
      SG=pSG;SR=pSR;SB=pSB;
      BB=pBB;BG=pBG;BR=pBR;
    }
    else{drop=!drop;
      if(!db.query("SELECT * FROM Settings WHERE theme='"+I+"'"))
    KetaiAlertDialog.popup(this,"Failed to Load Theme!","Sorry the app failed to load the theme.Please ensure that it has access to internal storage!");
    if(db.next()){
      theme=db.getString("theme");
      pSR=db.getInt("sred");
      pSG=db.getInt("sgreen");
      pSB=db.getInt("sblue");
      pBR=db.getInt("bred");
      pBG=db.getInt("bgreen");
      pBB=db.getInt("bblue");
      
    }
      SG=pSG;SR=pSR;SB=pSB;
      BB=pBB;BG=pBG;BR=pBR;
      bkd=color(BR,BG,BB);
      
    }
    time=second();
    
    clear();return true;}
  }
  return false;
}




int scroll_bar(int var,float x,float y,String s){
  
  float len=displayWidth/1.19,gap=60;
  float cx=map(var,0,255,x,x+len),cy=y+gap;
  fill(255,255,255);
  textSize(50);
  textAlign(LEFT);
  text(s+" "+nf(var,1,0),x,y,displayWidth,gap);
  strokeCap(ROUND);
  strokeWeight(20);
  stroke(#7BFDA5);
  line(x,y+gap,x+len,y+gap);
  
  stroke(#FF2424);
  ellipse(cx,cy,40,40);
  if(mousePressed&&!drop&&time!=second()){
    if(mouseY>=cy-40&&mouseY<=cy+40&&mouseX>x&&mouseX<x+len)
    {ellipse(mouseX,cy,40,40);
    change=true;
      //fill(bkd);stroke(bkd);ellipse(cx,cy,40,40);
      cx=mouseX;
      return int(map(cx,x,x+len,0,256));
    }
  }
  /*
  for(int i=0;i<6;i++){
  float j=map(i,0,6,x+1,x+len-1);
  stroke(255,255,255);
  strokeWeight(10);
  line(j,y+gap+15,j,y+gap+25);
  }
  */
  return var;
  
}