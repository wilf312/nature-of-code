/**
 * 流体抵抗のシミュレーション
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;

int moverLen = 100;
Mover[] mover = new Mover[moverLen];
Liquid liquid;


void setup () {
    //config
    size(stageWid, stageHei);

    background(255);

    liquid = new Liquid(0, height/2, width, height/2, 0.1);

    for (int cnt=0; cnt<moverLen; cnt++) {
        mover[cnt] = new Mover( random(0.2, 2) , random(0, width), random(0, height / 2));
    }
}



void draw() {
    // リセット処理
    background(255);


    for (int cnt=0; cnt<moverLen; cnt++) {

        if (liquid.contains(mover[cnt])) {
            PVector dragForce = liquid.drag(mover[cnt]);
            mover[cnt].applyForce(dragForce);
        }

        PVector gravity = new PVector(0, 0.1*mover[cnt].mass);
        mover[cnt].applyForce(gravity);

        mover[cnt].update();
        mover[cnt].checkEdges();
        mover[cnt].display();
    }
}
