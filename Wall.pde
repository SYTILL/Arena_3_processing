class Wall{
     int x,y,z;
     int hp = 100;
     Wall(int mx, int my, int dim){
         x=mx;
         y=my;
         z=dim;
     }
     void display(){ //draw walls
         fill(pcolor);
         if(x%2==0) rect(x*unit/2, y*unit+ww, ww, size); //vertical-wall
         else rect(x*unit/2-unit/2+ww, y*unit, size, ww); //horizontal-wall
     }
     void wallreset(){
         wallplaced[x][y] = false; 
     }
   
}
