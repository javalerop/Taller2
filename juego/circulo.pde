class nodo{
  float x, y;
  void display(){
    stroke(255,0,0);
    strokeWeight(8);
    for ( int i=0; i<=20; i++){
      ellipse(x, y, 20, 20);
    }
  }
  nodo(PVector pos){
    x = pos.x;
    y = pos.y;
  }
}
