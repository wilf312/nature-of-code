/**
 * 引力のシミュレーション
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;

int moverLen = 10;
Mover[] mover = new Mover[moverLen];
Attractor attract;
// Attractor b;

void setup () {
    //config
    size(stageWid, stageHei);

    background(255);

    // Attractor生成
    attract = new Attractor();

    // // Attractor生成
    // b = new Attractor();

    reset();


}

void reset() {


    // Mover生成
    float size = 1;
    for (int cnt=0; cnt<moverLen; cnt++) {
        mover[cnt] = new Mover( random(0.1, 2) , random(0, width), random(0, height) );
    }

}




void draw() {
    // // リセット処理
    background(255);


    for (int cnt=0; cnt<moverLen; cnt++) {
        Mover m = mover[cnt];


        // PVector forceAttractor = attract.attract( m );
        // m.applyForce(forceAttractor);

        for (int j = 0; j < moverLen; j++) {

            if ( j == cnt ) continue;

            PVector force = mover[j].repel( m );

            m.applyForce(force);
        }

        m.update();
        m.display();
    }
}
