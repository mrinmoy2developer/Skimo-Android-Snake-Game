class snake{
  
  cell[] body;
  cell apple;
  boolean skip,restart;
  int len,life,score,stat,count,bombs;
  int[]bx,by;
  color shade,sc,bk;
  int dx,dy,ax,ay,sx,sy,px,py;
  void move(){
    showstat();
    body[len-1].hide(bkd);
    for(int i=len-1;i>0;i--){
    body[i]=body[i-1];
    }
    cell t;
    t=body[1];
    body[0]=new cell(t.x+dx,t.y+dy,shade);
    body[0].show();
  }
  snake(color c,int n,int l){
    skip=false;
    restart=false;
    ax=int(random(X));
    ay=int(random(Y));
    bx=new int[bn];
    by=new int[bn];
    stat=4;
    for(int i=0;i<bn;i++){
      bx[i]=int(random(1,X-1));
      by[i]=int(random(1,Y-1));
      stroke(255,255,255);
     // point(bx[i]*(sw+gw),by[i]*(sw+gw));
    }
    apple=new cell(sx,sy,#FF0000);
    sc=#54EA2C;
    bk=#F400D2;
    setapple();
    score=0;
    sx=0;
    sy=12;
    bombs=bn;
    //image(apple,ax,ay,sw,sw);
    body=new cell[1000];
    //block=new cell[500];
    life=l;
    shade=c;
    dx=1;dy=0;
    len=n;
    for(int i=0;i<1000;i++){
    body[i]=new cell(0-i,12,shade);
    
    body[i].show();
    }
    //for(int i=0;i<50;i++){
    //block[i]=new cell(int(random(X)),int(random(Y)),bk);
    //block[i].show();
    //}
    
  }
  void showstat(){
    float l=stat;
    strokeWeight(5);
    stroke(bkd);
    fill(bkd);
    rect(px-5,py-5,sw+gw+10+30,20);
    fill(sc);
    int x=(body[0].x+1)*(sw+gw);
    int y=(body[0].y)*(sw+gw);
    if(dx==1){
      px=x;py=y-gw-20;
      //rect(px,py,sw+gw,10);
    }
     else if(dx==-1){
      px=x-gw-2*(sw+gw);
      py=y-gw-20;
      //rect(px,py,sw+gw,10);
    }
    else if(dy==-1){
      px=x+10;py=y-sw-gw;
      //rect(px,py,sw+gw,10);
    }
    else if(dy==1){
      px=x+gw+8;py=y+gw+sw;
      //rect(px,py,sw+gw,10);
    }
   stroke(sc);
   fill(0,0,0);
   rect(px-5,py-5,sw+gw+10+30,20);
   noStroke();
   fill(color((1-l/4)*255,(l/4)*255,0));
   rect(px,py,(sw+gw+30)*(l/4.0),10);
    
  }
  void setdir(){
    //int pdx=dx,pdy=dy;
    if(mousePressed){
    int px=mouseX-pmouseX;
    int py=mouseY-pmouseY;
    if(px==0&&py==0){px=mouseX/(sw+gw)-body[0].x;
    py=mouseY/(sw+gw)-body[0].y;}
    //if(py==0){px=mouseX/(sw+gw)-body[0].x;
    //py=mouseY/(sw+gw)-body[0].y;}
    if(abs(px)>abs(py)){
      if(px!=0)
    dx=px/abs(px);
    dy=0;
    }
    else if(py!=0){dy=py/abs(py);dx=0;}
  }
  }
  void show(){
    for(int i=0;i<len;i++)
    body[i].show();
  }
   void hide(){
    for(int i=0;i<len;i++)
    body[i].hide(bkd);
  }
  boolean hit(){
    if(body[0].x>X||body[0].x<0||body[0].y>Y||body[0].y<0)
    return true;
    for(int i=1;i<len;i++)
      if(body[0].x==body[i].x&&body[0].y==body[i].y)
      return true;
    return false;
    
  }
  void blink(){
    for(int i=0;i<5;i++){
      for(int j=0;j<len;j++)
      body[j].c=#EA6410;
      show();
      for(int k=0;k<len;k++)
      body[k].c=shade;
      show();
      
    }
    
  }
  void setapple(){
    ax=floor(random(0,X));
    ay=floor(random(0,Y));
    //cell t=new cell(body[len-1].x-dx,body[len-1].y-dy,shade);
    //body=app(body,t);
    apple.hide(shade);
    apple.x=ax;
    apple.y=ay;
    apple.show();
  }
  void setsnake(){
    //shade=bkd;
    hide();
    //show();
    body[0].x=sx;
    body[0].y=sy;
    dx=1;dy=0;
    
  }
  boolean collide(cell c){
    if(c.x==body[0].x&&c.y==body[0].y)
    return true;
    else return false;
  }
  void checkbomb(){
    for(int i=0;i<bn;i++)
    if(bx[i]!=-1&&by[i]!=-1)
    if(body[0].x==bx[i]&&body[0].y==by[i])
    {skip=true;bx[i]=-1;by[i]=-1;bombs--;
    shake();
    if(stat!=1)stat--;
    else {stat=4;life--;restart=true;}
    count=26 ;
    Burst[14]=get(body[0].x*(sw+gw)-10,body[0].y*(sw+gw)-10,sw+gw+10,sw+gw+10);
    }
  }
  void update (){
    if(skip){
      play();
      return;
    }
    checkbomb();
    apple.show();
    setdir();
    move();
    if(collide(apple)){
      shake();
      score++;setapple();len++;
      }
    if(hit()&&frameCount>6){
      shake();
    life--;setsnake();stat=4;
  }}
  void play(){
  if(count!=0)count--;
  else {count=26;skip=false;
  fill(bkd);
  image(Burst[14],body[0].x*(sw+gw)-10,body[0].y*(sw+gw)-10,sw+gw+10,sw+gw+10);
  if(restart){setsnake();restart=false;}
  return;
  }
  fill(bkd);
  image(Burst[14],body[0].x*(sw+gw)-10,body[0].y*(sw+gw)-10,sw+gw+10,sw+gw+10);
  if(i>=13)i=0;
  image(Burst[i++],body[0].x*(sw+gw)-10,body[0].y*(sw+gw)-10,sw+gw+10,sw+gw+10);
}
};

