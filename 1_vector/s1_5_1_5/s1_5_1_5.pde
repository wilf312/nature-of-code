/**
 * ベクトルの大きさをもとめる
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;


// スピード調整
float bai = 3;



// 中央位置のベクター定義
PVector center;

void setup () {
    //config
    size(stageWid, stageHei);

    background(255);


    center = new PVector(width / 2, height / 2);
}



void draw() {
    // リセット処理
    background(255);




    // マウス位置用のベクター生成
    PVector mouse = new PVector(mouseX, mouseY);


    mouse.sub(center);
    // 乗算、除算
    // mouse.div( 2 );
    // mouse.mult( 0.5 );



    // ベクトルの大きさを得るにはmag()関数を使う。
    // ここではウィンドウの上部に描画された長方形の幅として使用。
    float m = mouse.mag();
    fill(0);
    rect(0, 0, m, 10);


    translate(width / 2, height / 2);

    line(0, 0, mouse.x, mouse.y);





}

class PVector {
    float x;
    float y;

    // 初期化
    PVector(float x_, float y_) {
        x = x_;
        y = y_;
    }

    // PVector同士の加算
    void add(PVector v) {
        x = x + v.x;
        y = y + v.y;
    }

    // PVector同士の減算
    void sub(PVector v) {
        x = x - v.x;
        y = y - v.y;
    }

    // PVectorの乗算
    // 乗算では、ベクトルの書く要素に数値を掛ける
    void mult(float n) {
        x = x * n;
        y = y * n;
    }

    // PVectorの除算
    void div(float n) {
        x = x / n;
        y = y / n;
    }


    float mag() {
        return sqrt(x * x + y * y);
    }




}







// class Walker {
//     float x, y;
//     float tx, ty;

//     Walker() {
//         x = stageSize/2;
//         y = stageSize/2;

//         tx = 0 + random(0, 200);
//         ty = 10000  + random(0, 5000);

//     }


//     void display() {

//         stroke(1);
//         point(x, y);

//     }

//     void step() {

//         x = map(noise(tx), 0, 1, 0, width);
//         y = map(noise(ty), 0, 1, 0, height);

//         tx += 0.01;
//         ty += 0.01;

//     }

// }


