//image
String[] imageNames = {"wall.png","gun.png"};
PImage[] images = new PImage[imageNames.length]; 

//size
int size = 96; //just size...
int radius = size*3/4; //actually its diameter
int ww = 4; //wall width
int unit = size+ww;

//color
color[] colors = {color(235,115,121),color(250,243,102),color(0,178,225)};//red,yellow,blue
//color[] colors = {color(255,204,204),color(255,255,204),color(204,255,255)};//red,yellow,blue
color pcolor = colors[(int)random(colors.length)];

//player status
int hp = 100;
int res = 50;
int dem = 0; //dimension

//etc
int wall_x,wall_y;


ArrayList<Wall> walls;


void setup() {
    background(224);
    size(1000, 1000);
    ellipseMode(CENTER);
    noStroke();
    loadImages();
    pcolor = colors[2];
    walls = new ArrayList();
}

void draw() {
    grid();
    mousePos();
    if(mousePressed){
        walls.add(new Wall(wall_x,wall_y,dem));  
    }
    for(Wall temp : walls){
        temp.display(); 
    }
    
}

void mousePos(){
    int x,y;
    x = 2*(mouseX/unit);
    y = mouseY/unit;
    wall_x = mouseX%unit;
    wall_y = mouseY%unit;
    if(wall_x>wall_y){
        if((unit-wall_x)<wall_y){x+=2;}
        else{x++;}
    }else if((unit-wall_x)<wall_y){x++;y++;}
    wall_x = x;
    wall_y = y;
}




class Wall{
     int x,y,z;
     int hp = 100;
     Wall(int mx, int my, int dem){
         x=mx;
         y=my;
         z=dem;
     }
     void display(){
         fill(pcolor);
         if(x%2==0) rect(x*unit/2, y*unit+ww, ww, size); //vertical-wall
         else rect(x*unit/2-unit/2+ww, y*unit, size, ww); //horizontal-wall
     }
     
}

void grid() {
    int i;
    fill(200);
    for (i=0; i<10; i++) {
        rect(i*unit,0,ww,1000);
        rect(0,i*unit,1000,ww);
    }
}




void loadImages(){
  int i;
  for(i=0; i < imageNames.length; i++){
    String imageName = imageNames[i];
    images[i] = loadImage(imageName);
  }
}
