class Player{
    int hp = 100;
    int res = 500; //resourse for building
    int id;
    int x,y;
    int size;
    int speed = 4;
    boolean portal_event = false;
    
    Player(int player, int px, int py, int radius){
        id = player;
        x = px;
        y = py;
        size = radius;
    }
    
    void display(){
        fill(pcolor);
        rect(x,y,size,size); //player was ellipse shape
    }
    
    void move(){
        if(keys[LEFT]) x-=speed;
        else if(keys[RIGHT]) x+=speed;
        if(keys[UP]) y-=speed;
        else if(keys[DOWN]) y+=speed;
    }
    
    void portal(){
        if(!portal_event){
            if(600<x&&x<750&&600<y&&y<750){
                dim = (dim+4)%3;
                pcolor = colors[dim];
                portal_event = true;
            }
        } 
    }
  
}
