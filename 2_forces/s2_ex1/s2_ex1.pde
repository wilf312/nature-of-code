/**
 * 加速度の対話的処理
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
        mover[cnt] = new Mover();
    }
}


float tx = 0;
float ty = 10;
void draw() {
    // リセット処理
    background(255);



    // PVector wind = new PVector(0.41,0);

    float parlinNoise = map(noise(tx), 0, 1, 0, 0.5) -0.25;
    float parlinNoise2 = map(noise(ty), 0, 1, 0, 0.5) -0.25;
    println("parlinNoise: "+parlinNoise);
    PVector wind = new PVector(parlinNoise, parlinNoise2);

    PVector gravity = new PVector(0,0);
    // PVector gravity = new PVector(0,-0.1);


    for (int cnt=0; cnt<moverLen; cnt++) {

        // println("wind.x: "+wind.x);

        mover[cnt].applyForce(wind);
        mover[cnt].applyForce(gravity);

        // マウス押下しているときのみwindの値を上書き
        if ( mousePressed ) {
            mover[cnt].reset();
        }
        mover[cnt].update();
        mover[cnt].checkEdges();
        mover[cnt].display();
    }

    tx += 0.001;
    ty += 0.001;


}
