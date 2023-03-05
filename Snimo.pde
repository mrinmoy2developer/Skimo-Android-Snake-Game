import ketai.camera.*;
import ketai.net.nfc.record.*;
import ketai.net.wifidirect.*;
import ketai.net.*;
import ketai.net.bluetooth.*;
import ketai.cv.facedetector.*;
import ketai.sensors.*;
import ketai.data.*;
import ketai.net.nfc.*;
import ketai.ui.*;
import android.os.Vibrator;
import android.content.Context;

int sw=30,gw=4,t,l,b,state,i=0,bn=8,caller;
float fr;
color bkd,pbkd,pshade;
PFont font;
PImage Apple,Life,Logo,Play,Replay,Bomb,Keyboard;
PImage gameover,Settings,About_us,High_score;
PImage Exit,Scoreboard,Fingerprint;
PImage Pause,Resume,Back,UpArrow,DownArrow;
PImage[]Medals;
PImage[]Burst;
//String name="Mrinmoy Banik";
snake S;
KetaiVibrate vibe;
int X,pSR,pSG,pSB;
int SG,SB,SR,BG,BB,BR;
int Y,pBR,pBG,pBB;
void setup(){
  vibe=new KetaiVibrate(this);
  db=new KetaiSQLite(this);
  tx=displayWidth/20;ty=tx;tl=displayWidth/1.13;
  ky=ty+200;kh=0.5*displayWidth;kx=0;kl=displayWidth;
  fullScreen();
  state=0;
  caller=0;
  X=displayWidth/34;
  Y=displayHeight/34;
 //output=createWriter("Storage.txt");
  //output.println("Name");
  //textFont(createFont("cfont", 26 * displayDensity));
  //textFont(font);
  //text("Mrinmoy Banik",100,99);
  Medals=new PImage[4];
  Medals[1]=loadImage("gold.png");
  Medals[2]=loadImage("silver.png");
  Medals[3]=loadImage("bronze.png");
  UpArrow=loadImage("UR.png");
  DownArrow=loadImage("LR.png");
  Back=loadImage("back.png");
  Resume=loadImage("play.png");
  Pause=loadImage("pause.png");
  Apple=loadImage("apple.png");
  Life=loadImage("life.png");
  Logo=loadImage("logo.png");
  Play=loadImage("start.png");
  Replay=loadImage("replay.png");
  Bomb=loadImage("bomb.png");
  Scoreboard=loadImage("scoreboard.png");
  Exit=loadImage("Exit.png");
  Settings=loadImage("settings.png");
  About_us=loadImage("About_us.png");
  High_score=loadImage("high_score.png");
  Fingerprint=loadImage("fingerprint.jpg");
  Burst=new PImage[15];
  for(int i=0;i<14;i++)
  Burst[i]=loadImage(nf(i,1,0)+".gif");
  bkd=color(BR,BG,BB);
  //ax=int(random(0,X));
 // ay=int(random(0,Y));
 gameover =loadImage("PixelArt.png");
 Keyboard=loadImage("keyboard.png");
 fr=6;
 String[] k={"Name1"};
 //saveStrings("Storage.txt",k);
 
  //size(displayWidth,displayHeight);
  orientation (PORTRAIT);
  manage();
 SG=pSG;SR=pSR;SB=pSB;
 BB=pBB;BG=pBG;BR=pBR;
 background (bkd);
  
}
void draw(){
 //System.exit(0);
  //saveStrings("Here.txt",k_message);
  //output.println(second());
  //data=loadStrings("Storage.txt");
  //text(data[0],200,100,500,500);
  bkd=color(BR,BG,BB);
  //image(Bomb,300,400,100,100);
  switch(state){
  case 0:startscreen();break;
  case 1:gamescreen();break;
  case 2:gamescreen();break;
  case 3:gameoverscreen();break;
  case 4:textboxscreen();break;
  case 5:setting();break;
  case 6:About_us();break;
  case 10:textboxscreen();break;
  case 7:HighScore();break;
  case 9:paused();break;
  case 100: System.exit(0);break;
  default:startscreen();break;
  
  //if(S.life<0)return ;
  }
}
void shake(){
  //vibe.vibrate(100);
}