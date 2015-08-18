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




class Walker extends PVector {
    PVector t;

    Walker() {
        super(stageSize/2, stageSize/2);

        t = new PVector(0 + random(0, 200), 10000  + random(0, 5000) );

    }


    void display() {
        stroke(1);
        point(x, y);
    }

    void step() {

        myAdd(t);

    }

    void myAdd( PVector v ) {

        x = map(noise(v.x), 0, 1, 0, width);
        y = map(noise(v.y), 0, 1, 0, height);


        v.add( new PVector(0.01, 0.01) );

        v.x += 0.01;
        v.y += 0.01;



    }

}

class PVector {
    float x;
    float y;

    PVector (float x_, float y_) {
        x = x_;
        y = y_;
    }

    void add( PVector v ) {
        x += v.x;
        y += v.y;

    }
}


