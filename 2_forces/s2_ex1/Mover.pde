
// void keyPressed() {
//     println("keyCode: "+keyCode);

//     if ( keyCode == 38 ) {
//         mover.acceleration.y -= 0.001;
//     }
//     else if ( keyCode == 40 ) {
//         mover.acceleration.y += 0.001;

//     }
// }


// １ 位置に速度を加算
// ２ 位置にオブジェクトを描画
class Mover {
    PVector location;
    PVector velocity;
    PVector acceleration; // 加速度で使う新しいPVector
    float accelerationScale; // マウスに反応するベクトルのチカラ

    float topspeed;

    // コンストラクタ
    Mover() {
        // 中央
        // location        = new PVector( width/2, height/2 );
        // ランダム
        location        = new PVector( random(0, width), random(0, height) );

        accelerationScale = random(0.2, 0.8);

        velocity        = new PVector( 0, 0 );
        acceleration    = new PVector( 0, 0 );
        // acceleration    = new PVector( -0.001, 0.01 );

        // 変数topspeedで速度の大きさを制限
        topspeed        = 10;
    }




    // Moverを動かす
    void update() {

        // 運動アルゴリズムのコードが２行に
        velocity.add(acceleration);
        velocity.limit(10);
        location.add(velocity);
        acceleration.mult(0);
    }

    // Moverの表示
    void display() {
        stroke(0);
        fill(175);

        // println("location.x: "+location.x);
        // println("location.y: "+location.y);
        ellipse( location.x, location.y, 16, 16);
    }


    void reset() {
        acceleration = new PVector(0, 0);
        velocity = new PVector(0, 0);
    }



    // 端まで来たら位置を反対側の橋に設定
    void checkEdges() {
        // 右端
        if (  location.x > width) {
            location.x = 0;
            // velocity.x *= -1;

        }
        // 左端
        else if ( location.x < 0 )  {
            location.x = width;
            // velocity.x *= -1;
        }

        // 上端
        if ( location.y < 0 ) {
            velocity.y *= -1;
        }
        else if ( location.y > height ) {

            location.y = 0;
            // velocity.y *= -1;
        }
    }

    // 物体にチカラを加える
    void applyForce( PVector force ) {
        acceleration.add(force);
    }

}

