/**
 * ベクトル運動：速度
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;


Mover mover;

void setup () {
    //config
    size(stageWid, stageHei);

    background(255);


    mover = new Mover();
}



void draw() {
    // リセット処理
    background(255);

    mover.update();
    mover.checkEdges();
    mover.display();

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

    // ベクトルの大きさ
    float mag() {
        return sqrt(x * x + y * y);
    }

    // ベクトルの正規化 単位ベクトルの生成
    void normalize() {
        float m = mag();
        if ( m != 0 ) {
            div(m);
        }
    }

}


// １ 位置に速度を加算
// ２ 位置にオブジェクトを描画
class Mover {
    PVector location;
    PVector velocity;

    // コンストラクタ
    Mover() {
        location = new PVector( random(width) , random( height ) );
        velocity = new PVector( random(-2.2) , random( -2.2 ) );
    }

    // Moverを動かす
    void update() {
        location.add(velocity);


        println("location.x: "+location.x);
        println("location.y: "+location.y);

        println("velocity.x: "+velocity.x);
        println("velocity.y: "+velocity.y);

    }

    // Moverの表示
    void display() {
        stroke(0);
        fill(175);

        // println("location.x: "+location.x);
        // println("location.y: "+location.y);
        ellipse( location.x, location.y, 16, 16);
    }

    // 端まで来たら位置を反対側の橋に設定
    void checkEdges() {
        // 右端
        if (  location.x > width) {
            location.x = 0;
        }
        // 左端
        else if ( location.x < 0 )  {
            location.x = width;
        }

        // 下端
        if (  location.y > height) {
            location.y = 0;
        }
        // 上端
        else if ( location.y < 0 ) {
            location.y = height;
        }
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


