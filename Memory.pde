KetaiSQLite db;
String theme;
String create_clause= "CREATE TABLE Highscore( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,score INTEGER NOT NULL DEFAULT '0');";
void manage(){
  if(db.connect())
  {
    if(!db.tableExists("Highscore"))
    db.execute(create_clause);
    else println("Table Highscore exists!!!");
    if(!db.query("SELECT name FROM Highscore ORDER by id DESC LIMIT 1"))
    KetaiAlertDialog.popup(this,"Failed to Execute!","Sorry the application failed to load the Name of tge Player!Try again!");
    if(db.next()){
    buffer=db.getString("name");
    KetaiAlertDialog.popup(this,"Welcome!","Welcome "+buffer+" to my made-from-scratch snake game.Hope you like it!");}
    else {buffer="Player1";KetaiAlertDialog.popup(this,"New Player!","Please register your name to start playing!");state=5;}
    
    if(!db.tableExists("Settings"))
    db.execute("CREATE TABLE Settings (id INTEGER PRIMARY KEY AUTOINCREMENT,theme TEXT NOT NULL,bred INTEGER NOT NULL DEFAULT 0,bgreen INTEGER NOT NULL DEFAULT 0,bblue INTEGER NOT NULL DEFAULT 0,sred INTEGER NOT NULL DEFAULT 0,sgreen INTEGER NOT NULL DEFAULT 0,sblue INTEGER NOT NULL DEFAULT 0)");
    //else println("Table Settings exists!!!");
    db.query("SELECT COUNT(id) FROM Settings;");
    if(db.next()&&db.getInt("COUNT(id)")==0){
    if(!db.execute("INSERT INTO Settings (theme,sred,sgreen,sblue,bred,bgreen,bblue) VALUES ('default',106,250,240,55,50,50);"))
    KetaiAlertDialog.popup(this,"Failed to Load Theme!","Sorry the app failed to load the theme.Please ensure that it has access to internal storage!");}
    if(!db.query("SELECT * FROM Settings ORDER BY id ASC LIMIT 1"))
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
  }
  
}
