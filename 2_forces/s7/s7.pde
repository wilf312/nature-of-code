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



    PVector wind        = new PVector(0.001,0);

    // より正確にするため質量でスケーリング
    PVector gravity     = new PVector(0, 0.1);
    // 摩擦係数
    float c = 0.01;

    // マウス押下しているときのみwindの値を上書き
    if ( mousePressed ) {
        wind = new PVector(1, 0);
    }

    for (int cnt=0; cnt<moverLen; cnt++) {

        // ------ 摩擦の計算
        PVector friction = mover[cnt].velocity.get();

        // 反対方向
        friction.mult(-1);

        // 力の方向のためだからノーマライズ
        friction.normalize();

        // 単位ベクトルを習得し、これに大きさを掛けて力のベクトルを求める
        friction.mult(c);

        // 摩擦の反映
        mover[cnt].applyForce(friction);
        // ------ /摩擦の計算


        mover[cnt].applyForce(wind);
        mover[cnt].applyForce(gravity);

        mover[cnt].update();
        mover[cnt].checkEdges();
        mover[cnt].display();
    }


}
