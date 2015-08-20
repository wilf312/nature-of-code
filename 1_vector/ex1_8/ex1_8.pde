/**
 * 加速度の対話的処理
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;

int moverLen = 10;
Mover[] mover = new Mover[moverLen];



PVector v1;
PVector v2;
float screenVPower;

void setup () {
    //config
    size(stageWid, stageHei);

    background(255);

    v1 = new PVector(0, 0);
    v2 = new PVector(width, height);
    screenVPower = PVector.dist(v1, v2);
    println("screenVPower: "+screenVPower);



    for (int cnt=0; cnt<moverLen; cnt++) {
        mover[cnt] = new Mover();
    }
}



void draw() {
    // リセット処理
    background(255);


    for (int cnt=0; cnt<moverLen; cnt++) {
        mover[cnt].update();
        mover[cnt].checkEdges();
        mover[cnt].display();
    }


}

