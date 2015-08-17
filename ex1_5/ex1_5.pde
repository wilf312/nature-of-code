import java.util.Random;
Random posGenerator;



// Walker w;
int walkerLength = 100;
Walker[] walkArr = new Walker[walkerLength];

int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;




void setup () {
    //config
    size(stageWid, stageHei);

    posGenerator    = new Random();

    for(int cnt=0; cnt < walkerLength; cnt++) {
        walkArr[cnt] = new Walker();
    }
}






void draw() {


    for(int cnt=0; cnt < walkerLength; cnt++) {
        walkArr[cnt].step();
        walkArr[cnt].display();
    }

}

class Walker {
    int x;
    int y;

    void Walker() {
        x = stageSize/2;
        y = stageSize/2;
    }


    void display() {

        stroke(1);
        point(x, y);

    }

    void step() {


        float numx = (float) posGenerator.nextGaussian();
        float numy = (float) posGenerator.nextGaussian();
        float sd = 10;
        float mean = 10;

        float stepx = sd * numx + mean - 10;
        float stepy = sd * numy + mean - 10;


        // float stepx = random(1)-0.5;
        // float stepy = random(1)-0.5;

        x += stepx;
        y += stepy;


    }

}


