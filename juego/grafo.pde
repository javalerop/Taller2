class Grafo{
  String archivo;
  void display(){
    Table table = loadTable( archivo, "header");
    matriz1 = new int [table.getColumnCount()][table.getColumnCount()];
    for ( int i = 0; i<table.getColumnCount(); i++){
      for ( int j = 0; j<table.getColumnCount(); j++){
        TableRow row = table.getRow( i+table.getColumnCount()+1);
        matriz1 [i][j] = row.getInt(j);
      }
    }
    for (int i=0; i<table.getColumnCount(); i++){
      for (int j=0; j<table.getColumnCount(); j++){
        if(matriz1[i][j]!=0){
          count+=1;
        }
      }
    }
    for (int i=0; i<table.getColumnCount(); i++){
      TableRow row = table.getRow(i);
      x = row.getFloat("x");
      y = row.getFloat("y");
      m[i] = new PVector(x, y);
      nodo nod = new nodo(m[i]);
      nod.display();
    }
    for (int i=0; i <table.getColumnCount(); i++){
      for ( int j=0; j <table.getColumnCount(); j++){
        if ( matriz1[i][j]!=0){
          strokeWeight(7);
          stroke(255);
          linea line = new linea(m[i].x, m[i].y, m[j].x, m[j].y);
          line.display();
        }
      }
    }
  }
  Grafo (String file){
    archivo = file;
  }
}
