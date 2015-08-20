
class Mover {
    PVector location;
    PVector velocity;
    PVector acceleration; // 加速度で使う新しいPVector

    float topspeed;

    // コンストラクタ
    Mover() {
        // 中央
        // location        = new PVector( width/2, height/2 );
        // ランダム
        location        = new PVector( random(0, width), random(0, height) );


        velocity        = new PVector( 0, 0 );
        acceleration    = new PVector( -0.001, 0.01 );

        // 変数topspeedで速度の大きさを制限
        topspeed        = 10;
    }




    // Moverを動かす
    void update() {

        // マウスの座標からPVector生成
        PVector mouse = new PVector(mouseX, mouseY);

        // オブジェクトからターゲット位置（マウス）を指すベクトルを計算します
        PVector dir = PVector.sub(mouse, location);

        println("acceleration: "+acceleration);

        // このベクトルを正規化します。
        dir.normalize();

        acceleration = dir;

        // 運動アルゴリズムのコードが２行に
        velocity.add(acceleration);
        velocity.limit(10);
        location.add(velocity);

    }

    // Moverの表示
    void display() {
        stroke(0);
        fill(175);
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


