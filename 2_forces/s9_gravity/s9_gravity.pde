/**
 * 引力のシミュレーション
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;

int moverLen = 100;
Mover[] mover = new Mover[moverLen];
Attractor a;

void setup () {
    //config
    size(stageWid, stageHei);

    background(255);

    // Attractor生成
    a = new Attractor();

    reset();


}

void reset() {


    // Mover生成
    float size = 1;
    for (int cnt=0; cnt<moverLen; cnt++) {
        mover[cnt] = new Mover( random( size * 0.4 , size * 2.4 ) , random(0, width), random(0, height / 2));
    }

}




void draw() {
    // リセット処理
    background(255);

    // Attractorオブジェクトの表示
    a.display();

    if (mousePressed) {
        reset();
    }

    for (int cnt=0; cnt<moverLen; cnt++) {

        Mover m = mover[cnt];
        // 重力の処理
        PVector f = a.attract(m);
        m.applyForce(f);



        // PVector gravity = new PVector(0, 0.1*m.mass);
        // m.applyForce(gravity);

        m.update();
        m.checkEdges();
        m.display();
    }
}
