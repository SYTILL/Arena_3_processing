class Wall{
     int x,y,z;
     int hp = 100;
     Wall(int mx, int my, int dim){
         x=mx;
         y=my;
         z=dim;
     }
     void display(int dim){ //draw walls
         if(z==dim){
             fill(colors[z]);
             if(x%2==0) rect(x*unit/2, y*unit+ww, ww, size); //vertical-wall
             else rect(x*unit/2-unit/2+ww, y*unit, size, ww); //horizontal-wall
         }else if((z+3)%3==(dim+5)%3){
             fill(back_colors[z]);
             if(x%2==0) rect(x*unit/2, y*unit+ww, ww, size); //vertical-wall under
             else rect(x*unit/2-unit/2+ww, y*unit, size, ww); //horizontal-wall under
         }else {fill(0);stroke(1); text("else: "+z,100,150); noStroke();}
     }
     void wallreset(){
         wallplaced[z][x][y] = false; 
     }
   
}
