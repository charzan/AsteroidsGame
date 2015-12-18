//your variable declarations here
SpaceShip joe = new SpaceShip();
Star [] sky = new Star[400];
ArrayList <Asteroid> danger1 = new ArrayList <Asteroid>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
int numAs = 25;
int screenSize ;

public void setup() 
{
  //your code here
  size(500, 500);
  screenSize = displayWidth;
  for (int i = 0; i < sky.length; i++)
  {
   sky[i] = new Star(); 
  }

  for(int i = 0; i < numAs; i++)
  {
    danger1.add(new Asteroid());
  }

}
public void draw() 

{
  //your code here
  background(0);
  joe.show();
  if(keyPressed == true){joe.keyPressed();}
  
 //stars
  joe.move();
  for (int i = 0; i < sky.length; i++)
  {
   sky[i].show(); 
  }

//bullets

  for(int i = 0; i < bullets.size(); i++)
  {
    bullets.get(i).show();
    bullets.get(i).move();
  }


//asteroids colliding with ship
  for(int i = 0; i < danger1.size(); i++)
  {
    Asteroid ast = danger1.get(i); 
    boolean hitAnyBullet = false;

    for(int j = 0; j < bullets.size(); j++)
    {
      Bullet bill = bullets.get(j);
      double bulletDistance = dist(ast.getX(), ast.getY(), bill.getX(), bill.getY());

      if(bulletDistance < 20)
      {
        hitAnyBullet = true;
        bullets.remove(j);
      }
    }

    if(hitAnyBullet)
    {
        danger1.remove(i);
    }
    else
    {
        ast.show();
        ast.move();
    }

  }
}

class Star
{
  public int starX;
  public int starY;
  public int starSize;

  public Star()
  {
    starX = (int)(Math.random()*screenSize);
    starY = (int)(Math.random()*screenSize);
    starSize = (int)(Math.random()*5);
  }
  public void show()
  {
    stroke(45, 63, 255);
    fill(255);
    ellipse(starX, starY, starSize, starSize);  
  }
}

class SpaceShip extends Floater  
{   
    //your code here
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return (double)myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return (double)myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return (double)myPointDirection;}

    public SpaceShip() 
    {
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int [corners];
      xCorners[0] =  5;
      yCorners[0] =  0;
      xCorners[1] = -8;
      yCorners[1] = -5;
      xCorners[2] = -3;
      yCorners[2] =  0;
      xCorners[3] = -8;
      yCorners[3] =  5;

      myColor = color(255, 0, 0);
      setX(255);
      setY(255);
      setDirectionX(0);
      setDirectionY(0);
      setPointDirection(0);
    }

    public void keyPressed()
    {
      if(key == 'w'){joe.rotate(5);}
      if(key == 's'){joe.rotate(-5);}
      if(key == 'a'){joe.accelerate(0.03);}
      if(key == 'd'){joe.accelerate(-0.03);}
      if(key == 'p'){bullets.add(new Bullet(joe));}
      if(key == 'o')
        {
          joe.setDirectionY(0);
          joe.setDirectionX(0);
        }
      if(key == 'h')
      {
         joe.setX((int)(Math.random()*screenSize));
         joe.setY((int)(Math.random()*screenSize));
         joe.setPointDirection((int)(Math.random()*360));
         joe.setDirectionY(0);
         joe.setDirectionX(0);         
      }

    }
}

class Asteroid extends Floater
{

  private int rotateSpeed;
  private int speedX;
  private int speedY; 

  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return (double)myPointDirection;}

  public Asteroid()
  {
    rotateSpeed = (int)(Math.random()*10-5);
    speedX = (int)(Math.random()*10-5);
    speedY =(int)(Math.random()*10-5);
    corners  = 16;
    xCorners = new int[corners];
    yCorners = new int [corners];
    xCorners[0] = 17;
    yCorners[0] = 0;
    xCorners[1] = 20;
    yCorners[1] = 5;
    xCorners[2] = 17;
    yCorners[2] = 15;
    xCorners[3] = 10;
    yCorners[3] = 17;

    xCorners[4] = 0;
    yCorners[4] = 22;
    xCorners[5] = -5;
    yCorners[5] = 20;
    xCorners[6] = -10;
    yCorners[6] = 12;
    xCorners[7] = -15;
    yCorners[7] = 5;

    xCorners[8] =  -14;
    yCorners[8] = 0;
    xCorners[9] = -15;
    yCorners[9] = -5;
    xCorners[10] = -13;
    yCorners[10] = -7;
    xCorners[11] = -7;
    yCorners[11] = -7;

    xCorners[12] = 0;
    yCorners[12] = -15;
    xCorners[13] = 4;
    yCorners[13] = -17;
    xCorners[14] = 7;
    yCorners[14] = -15;
    xCorners[15] = 15;
    yCorners[15] = -10;


    myColor = color(41, 61, 61);
    setX((int)(Math.random()*screenSize));
    setY((int)(Math.random()*screenSize));
    setDirectionX(0);
    setDirectionY(0);
    setPointDirection(0);
  }

  public void move()
  {
    super.move();
    myCenterX += speedX;
    myCenterY += speedY;
    rotate(rotateSpeed);

  }
}

class Bullet extends Floater
{
  private double bulletSpeed;


  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return (double)myPointDirection;}

  Bullet(SpaceShip theShip)
  {
    bulletSpeed = 7;

    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();

  }
  public void show()
  {
    fill(255);
    noStroke();
    ellipse(getX(), getY(), 4, 4);
  }
  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;    
  }
}




abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  

  }   
} 

