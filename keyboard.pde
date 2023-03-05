String buffer="\0";
String[] k_message={"Click here to use android soft keyboard!","Click here to hide android soft keyboard!"};
String[] keys={"q","w","e","r","t","y","u","i","o","p","⏏️","a","s","d","f","g","h","j","k","l","?123","z","x","c","v","b","n","m","<<",".",",","~","<","S","P","A","C","E",">","✓"};
float tx,ty,tl,kx,ky,kh,kl;
color tc=#135CF5;
int time;
boolean ks=false,edited=false;
void textboxscreen(){
  
  clear();
 if(mousePressed){
    if(mouseX>tx-50&&mouseX<displayWidth-2*tx&&mouseY>ty+125&&mouseY<ty+200)
      if(!ks&&abs(time-second())>1){KetaiKeyboard.toggle(this);ks=true;time=second();}
      else if(ks&&abs(time-second())>1){ks=false;KetaiKeyboard.toggle(this);time=second();}
    if(mouseX>displayWidth/3&&mouseX<displayWidth*2/3&&mouseY>kh+ky+50&&mouseY<kh+ky+150)
    {shake();
    
    if(state==10){
    if(edited&&!db.execute("INSERT INTO Settings (theme,sred,sgreen,sblue,bred,bgreen,bblue) VALUES ('"+buffer+"',"+SR+","+SG+","+SB+","+BR+","+BG+","+BB+")"))
     KetaiAlertDialog.popup(this,"Failed to Load Theme!","Sorry the app failed to load the theme.Please ensure that it has access to internal storage!");
     else if(!edited&&!(db.execute("UPDATE Settings SET sred="+SR+",sgreen="+SG+",sblue="+SB+",bred="+BR+",bblue="+BB+",bgreen="+BG+" WHERE theme='"+theme+"'")))
     KetaiAlertDialog.popup(this,"Failed to Update Theme!","Sorry the app failed to update the theme.Please ensure that it has access to internal storage!");
     else KetaiAlertDialog.popup(this,"Succesfull!","Your theme has been saved successfully!");
     theme=buffer;
     if(!db.query("SELECT name FROM Highscore ORDER by id DESC LIMIT 1"))
    KetaiAlertDialog.popup(this,"Failed to Execute!","Sorry the application failed to load the Name of tge Player!Try again!");
    if(db.next())
    buffer=db.getString("name");
    }
     
    state=caller;
    if(ks){KetaiKeyboard.toggle(this);ks=false;time=second();}
    }
  }
  
  fill(tc);
  rect(displayWidth/3,ky+kh+50, displayWidth/3,100);
  fill(#F6F6F6);
  textAlign(CENTER);
  text("Save",displayWidth/3-5,ky+kh+75, displayWidth/3,100);
  fill(255,255,255);
  stroke(5);
  strokeWeight(10);
  strokeCap(ROUND);
  rect(tx,ty,tl,100);
  textSize(37);
  textAlign(CENTER);
  fill(bkd);
  noStroke();
  rect(tx-40,ty+120,displayWidth,50);
  fill(255,99,32,127+map(abs(1-second()%2),0,1,-127,127));
  text(k_message[int(ks)],tx-40,ty+125,displayWidth,100);
  stroke(10);
  fill(255,255,255);
  rect(kx,ky,kl,kh);
  for(int i=0;i<40;i++)
  if(i<33||i>37) rect(((i%10)*kl)/10,(kh/4)*int(i/10)+ky,kl/10,kh/4);
  fill(#1200FF);
  textSize(60);
  
  for(int i=0;i<40;i++){
    if(keys[i]=="^")
    text("_",((i%10)*kl)/10,(kh/4)*int(i/10)+ky+20,kl/10,kh/4);
  text(keys[i],((i%10)*kl)/10,(kh/4)*int(i/10)+ky+20,kl/10,kh/4);}
  
  textAlign(LEFT);
  text(buffer,tx+10,ty+30,tl,90);

}
public void keyPressed(){
    edited=true;
    if(key!=65535)buffer+=key;
    else if((state==10||state==4)&&buffer.length()>0)
    buffer=buffer.substring(0,buffer.length()-1);
    //println(key);
  
  
}