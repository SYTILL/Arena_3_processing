//image
String[] imageNames = {"wall.png","gun.png","portal.png"};
PImage[] images = new PImage[imageNames.length]; 

//size
int size = 96; //just size...
int radius = size*3/4; //actually its diameter
int ww = 4; //wall width
int unit = size+ww; //the basic unit
int map_width = 10; //units of map
int map_height = 10;//same here

//player
int dim = (int)random(3); //dimension 0=red 1=yellow 2=blue
int id = 5; //for online and i just choose #5
int player_x=300,player_y=400;

//color
color[] colors = {color(235,115,121),color(250,243,102),color(0,178,225)};//red,yellow,blue -color ver.1
//color[] colors = {color(255,204,204),color(255,255,204),color(204,255,255)};//red,yellow,blue -color ver.2
color[] back_colors = {color(255,204,204),color(255,255,204),color(204,255,255)};
color pcolor = colors[dim];

//wall
int wall_x,wall_y;
boolean[][][] wallplaced = new boolean[3][map_height*2+1][map_height+1];

//keys
boolean[] keys = new boolean[128];

//class
ArrayList<Wall> walls;
Player player;



void setup() {
    background(224);
    size(1000, 1000);
    ellipseMode(CENTER);
    noStroke();
    loadImages();
    walls = new ArrayList();
    player = new Player(id,player_x,player_y,radius);
}

void draw() {
    background(244);
    grid();
    image(images[2],600+ww,600+ww,size,size);
    mousePosWall();
    mouseDown();
    for(Wall i : walls){
        i.display(dim); 
    }
    removeToLimit(20);
    
    player.display();
    player.move();
    player.portal();
    fill(0);stroke(1); text("current dimension: "+dim,100,100); noStroke();
}



void keyPressed(){
    keys[keyCode] = true;
}

void keyReleased(){
    keys[keyCode]  = false;
}

void resetWallArray(){
    int i,j;
    for(i=0;i<map_height*2+1;i++) for(j=0;j<map_height+1;j++) wallplaced[dim][i][j]=false;
}

void mouseDown(){ //i wanted to name this function as 'mousePressed' but thats one of processing function :(
    if(0<mouseX&&mouseX<width&&0<mouseY&&mouseY<height){
        if(mousePressed){
            if(!wallplaced[dim][wall_x][wall_y]){
                walls.add(new Wall(wall_x,wall_y,dim)); //add new wall in Wall Array
                wallplaced[dim][wall_x][wall_y] = true; //not to overlap walls cuz theres wall limits
            }
        }
    }
}

void mousePosWall(){ //position of mouse for wall
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


void removeToLimit(int maxLength){ //limit the number of walls
    while(walls.size() > maxLength) {
        Wall i = walls.get(0);
        i.wallreset(); 
        walls.remove(0);
    }
}

void grid() { //grid
    int i;
    fill(200);
    for (i=0; i<10; i++) {
        rect(i*unit,0,ww,1000);
        rect(0,i*unit,1000,ww);
    }
}

void loadImages(){ //loadImages
    int i;
    for(i=0; i < imageNames.length; i++){
        String imageName = imageNames[i];
        images[i] = loadImage(imageName);
    }
}
