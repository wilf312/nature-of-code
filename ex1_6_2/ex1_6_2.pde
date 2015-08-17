import java.util.Random;
Random posGenerator;



// Walker w;
int walkerLength = 30;
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
    float x, y;
    float tx, ty;

    Walker() {
        x = stageSize/2;
        y = stageSize/2;

        tx = 0 + random(0, 200);
        ty = 10000  + random(0, 5000);

    }


    void display() {

        stroke(1);
        point(x, y);

    }

    void step() {

        x = map(noise(tx), 0, 1, 0, width);
        y = map(noise(ty), 0, 1, 0, height);

        tx += 0.01;
        ty += 0.01;

    }

}


