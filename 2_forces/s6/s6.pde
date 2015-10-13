/**
 * 地球の重力と力のシミュレーション
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;

int moverLen = 100;
Mover[] mover = new Mover[moverLen];


void setup () {
    //config
    size(stageWid, stageHei);

    background(255);

    for (int cnt=0; cnt<moverLen; cnt++) {
        mover[cnt] = new Mover( random( 0.1, 2) , 0, 0);
    }
}



void draw() {
    // リセット処理
    background(255);



    PVector wind        = new PVector(0.01,0);

    // マウス押下しているときのみwindの値を上書き
    if ( mousePressed ) {
        wind = new PVector(1, 0);
    }

    for (int cnt=0; cnt<moverLen; cnt++) {

        println("wind.x: "+wind.x);

        // 重力を質量でスケーリング
        float m = mover[cnt].mass;
        PVector gravity     = new PVector(0, 0.1 * m);

        mover[cnt].applyForce(wind);
        mover[cnt].applyForce(gravity);

        mover[cnt].update();
        mover[cnt].checkEdges();
        mover[cnt].display();
    }


}
