PImage fondo;
PImage ganar;
PImage perder;
int L1, L2, ko, l , p;
int count;
int[][] matriz1, matriz2;
boolean mousePressed, mouse;
PVector[] m;
float X;
float Y;
float X2;
float Y2;
float x1;
float x2;
float y1;
float y2;
float x;
float y;
StringList nivel = new StringList(3);


void setup(){
  size(900, 603);

  fondo = loadImage("fondo.png");
  
  background(0);

  nivel.append("nivel1.csv");
  nivel.append("nivel2.csv");
  nivel.append("nivel3.csv");
  Table table = loadTable( nivel.get(1), "header");
  p=0;
  ko = table.getColumnCount();
  m = new PVector[ko];
  L1=0;
  L2=0;
  mouse= false;

  matriz2 = new int[table.getColumnCount()][table.getColumnCount()];
  for (int i = 0; i<table.getColumnCount(); i++){
    for (int j = 0; j<table.getColumnCount(); j++){
      matriz2[i][j] = 0;
      }
  }
  Grafo grafo = new Grafo(nivel.get(1));
  grafo.display();
  loop();
}

void draw(){
  stroke(0,0,255);
  image( fondo, 590, 0);
  if(mousePressed==true && mouse == false){
    for(int i=0; i<ko; i++){
      if (mouseX > (m[i].x -20)&& mouseX <(m[i].x +20)&& mouseY >(m[i].y -20)&&mouseY<(m[i].y+20)){
        x1 =m[i].x;
        y1=m[i].y;
        L1= i;
        p++;
      }
      mouse = true;
    }
  }
  X = x1;
  Y = y1;
  if (mousePressed == true && mouse ==true){
    for (int i=0; i<ko; i++){
      if(mouseX >(m[i].x -20) && mouseX< (m[i].x +20) && mouseY >(m[i].y -20) && mouseY < (m[i].y +20)){
        x2 = m[i].x;
        y2 = m[i].y;
        L2 = i;
        p++;
      }
    }
  }
  for ( int i=0; i<ko; i++){
    for (int j=0; j<ko; j++){
      if(i==L1 && j==L2 && matriz1[L1][L2]!=0){
        completarmatriz();
        linea lin = new linea(x1, y1, x2, y2);
        p=0;
        lin.display();
        x1=x2;
        y1=y2;
        L1=L2;
      }
    }
  }
  if(p>=13 && ganar()== false){
    perder = loadImage("perder.png");
    image(perder, 0, 0);
 
  }
  if (ganar()==true){
    if (1<=13){
      p++;  
    }
    
    setup();
    ganar = loadImage("gana.png");
    image(ganar, 0,0);
  }
}
void mousePressed(){
  mousePressed = true;
}
void mouseReleased(){
  mousePressed= false;
}
void completarmatriz(){
  for(int i=0; i<ko; i++){
    for(int j=0; j<ko; j++){
      if((L1!=0 || L2!= 0) && i==L1 && j==L2){
        matriz2[L1][L2]+=1;
        matriz2[L2][L1]+=1;
        matriz2[i][i]=0;
      }
    }
  }
}


void keyPressed(){
  if(key == 'x'){
    setup();
  }
}

boolean ganar(){
  for(int i=0; i<ko; i++){
    for(int j=0; j<ko; j++){
      if(matriz2[i][j]!= matriz1[i][j]){
        return false;
      }
    }
  }
  return true;
}
