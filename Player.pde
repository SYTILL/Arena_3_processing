class Player{
    int hp = 100;
    int res = 500; //resourse for building
    int id;
    int x,y;
    int size;
    int speed = 4;
    
    Player(int player, int px, int py, int radius){
        id = player;
        x = px;
        y = py;
        size = radius;
    }
    
    void display(){
        fill(pcolor);
        ellipse(x,y,size,size);
    }
    
    void move(){
        if(keys[LEFT]) x-=speed;
        else if(keys[RIGHT]) x+=speed;
        if(keys[UP]) y-=speed;
        else if(keys[DOWN]) y+=speed;
    }
  
}
