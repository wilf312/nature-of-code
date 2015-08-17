
int stageWid = 500;
int stageHei = 500;




// Walker w;
int walkerLength = 100;
Walker[] walkArr = new Walker[walkerLength];


void setup () {
    //config
    size(stageWid, stageHei);

    smooth();

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
    float r1;
    float r2;
    float r3;

    // 初期化
    Walker() {
        // 座標の中央に置く
        x = int( random(0, width ) );
        y = int( random(0, height ) );

        r1 = random(1);
        r2 = random(r1, 1);
        r3 = random(r2, 1);
    }

    void display() {

        stroke(0);

        point(x,y);
    }

    void step() {

        float stepx;
        float stepy;

        int kakuritux = 0;
        int kakurituy = 0;

        if ( mouseX < x ) {
            kakuritux--;
        }
        else {
            kakuritux++;
        }
        if ( mouseY < y ) {
            kakurituy--;
        }
        else {
            kakurituy++;
        }

        // 0, 1, 2 通常のランダム
        stepx = int( random(3+kakuritux) ) -1;
        stepy = int( random(3+kakurituy) ) -1;

        x += stepx;
        y += stepy;




    }


}
