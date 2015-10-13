
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

    float mass; // オブジェクトは質量をもつ!

    // コンストラクタ
    Mover( float m, float x, float y ) { // 引数を使ってこれらの変数を設定
        mass = m; // 単純化するため質量を1に設定

        location        = new PVector( x, y );
        velocity        = new PVector( 0, 0 );
        acceleration    = new PVector( 0, 0 );
    }




    // Moverを動かす
    void update() {

        velocity.add(acceleration); // ch 1 のMotion101
        location.add(velocity);
        acceleration.mult(0); // 加速を毎回クリアする処理を追加
    }

    // Moverの表示
    void display() {
        stroke(0);
        fill(175);

        // println("location.x: "+location.x);
        // println("location.y: "+location.y);
        ellipse( location.x, location.y, mass* 16, mass* 16);
    }



    // 端まで来たら位置を反対側の橋に設定
    void checkEdges() {
        // 右端
        if (  location.x > width) {
            // location.x = 0;
            velocity.x *= -1;

        }
        // 左端
        else if ( location.x < 0 )  {
            // location.x = width;
            velocity.x *= -1;
        }

        // 上端
        if ( location.y < 0 ) {
            location.y = height;
            // velocity.y *= -1;
        }
        else if ( location.y > height ) {

            // location.y = 0;
            velocity.y *= -1;
        }
    }

    // 物体にチカラを加える
    void applyForce( PVector force ) { // ニュートンの第二法則

        PVector f = PVector.div(force, mass); // 力を受け取って除算し、加速度に加算

        acceleration.add(f);
    }

}

