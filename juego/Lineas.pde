class linea{
  float X, Y, X2, Y2;
  void display(){
    strokeWeight(3);
    line(X,Y,X2,Y2);
  }
  linea(float x1, float y1, float x2, Float y2){
    X = x1;
    Y = y1;
    X2 = x2;
    Y2 = y2;
  }
}
