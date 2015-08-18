int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;


// スピード調整
float bai = 3;

// float x = 100;
// float y = 100;
// float xspeed = 1 * bai;
// float yspeed = 3.3 * bai;

// ↓ PVectorにまとめると

PVector location = new PVector(100, 100);
PVector velocity = new PVector(1 * bai, 3.3 * bai);

void setup () {
    //config
    size(stageWid, stageHei);

    background(255);
}



void draw() {
    // リセット処理
    background(255);


    // 次の場所をボールの速さに準じて移動する
    // x = x + xspeed;
    // y = y + yspeed;

    location.add(velocity);

    // 横幅を超えたときと横幅がマイナスになったとき移動先を反転
    if ( (location.x > width) || (location.x < 0) ) {
        velocity.x = velocity.x * -1;
    }


    // 縦幅を超えたときと縦幅がマイナスになったとき移動先を反転
    if ( (location.y > height) || (location.y < 0) ) {
        velocity.y = velocity.y * -1;
    }



    // 描画
    // 外枠色0黒
    stroke(0);
    // 塗りつぶし175
    fill(175);

    // x,y座標に縦横16の円を作成
    ellipse(location.x, location.y, 16, 16);


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


