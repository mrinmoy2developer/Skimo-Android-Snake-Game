String[] para={"ABOUT THE DEVELOPER:-",
" "," ",
"Nobody actually needs to know",
"who I am or what in the world",
"was the purpose making this game!",
"But still this is what I have to say about myself"
,"My name is Mrinmoy Banik",
"and I am a student of class 12,CBSE",
"South Point High School",
"or specifically I am",
"a JEE aspirant!"};
float up=0,end=30;
void About_us(){
  background(0,0,0);
  textAlign(CENTER);
  textSize(50);
  fill(255,255,255);
  stroke(255,255,255);
  float sp=80,v=5;
  for(int i=0;i<12;i++)
  text(para[i],0,sp*i+displayHeight -up, displayWidth,sp);
  
  if(up>end*sp){state=0;up=0;}
  if(! mousePressed)up+=v;
}