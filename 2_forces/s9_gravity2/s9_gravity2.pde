/**
 * 引力のシミュレーション
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;

int moverLen = 10;
Mover[] mover = new Mover[moverLen];
Attractor a;
Attractor b;

void setup () {
    //config
    size(stageWid, stageHei);

    background(255);

    // Attractor生成
    a = new Attractor();

    // // Attractor生成
    // b = new Attractor();

    reset();


}

void reset() {


    // Mover生成
    float size = 1;
    for (int cnt=0; cnt<moverLen; cnt++) {
        mover[cnt] = new Mover( 0.2 , random(0, width), random(0, height / 2));
    }

}




void draw() {
    // // リセット処理
    // background(255);

    // Attractorオブジェクトの表示
    a.display();
    // Attractorオブジェクトの表示
    // b.display();

    if (mousePressed) {
        reset();
        background(255);
    }

    for (int cnt=0; cnt<moverLen; cnt++) {

        Mover m = mover[cnt];
        // 重力の処理
        PVector f1 = a.attract(m);
        m.applyForce(f1);
        // PVector f2 = b.attract(m);
        // m.applyForce(f2);


        m.update();
        m.checkEdges();
        m.display();
    }
}
