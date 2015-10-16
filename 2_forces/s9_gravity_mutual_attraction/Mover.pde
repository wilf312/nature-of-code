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


    color fillColor;


    float mass; // オブジェクトは質量をもつ!
    float G;



    // コンストラクタ
    Mover( float m, float x, float y ) { // 引数を使ってこれらの変数を設定
        mass = m; // 単純化するため質量を1に設定

        location        = new PVector( x, y );
        velocity        = new PVector( 0, 0 );
        acceleration    = new PVector( 0, 0 );
        mass = 2;
        G = 0.4;

        fillColor = getColor();
    }




    // Moverを動かす
    void update() {

        velocity.add(acceleration); // ch 1 のMotion101
        location.add(velocity);
        acceleration.mult(0); // 加速を毎回クリアする処理を追加
    }

    // Moverの表示
    void display() {

        noStroke();
        fill(fillColor);

        // println("location.x: "+location.x);
        // println("location.y: "+location.y);
        ellipse( location.x, location.y, mass* 16, mass* 16);
    }


    color getColor() {
        color[] colorData = {
            #F92500,
            #0C00CC,
            #0B2BD7,
            #FFFF00,
            #22C350
        };

        return colorData[int(random(0, colorData.length ))];
    }


    PVector attract(Mover m) {

        PVector force = PVector.sub(location, m.location);

        float distance = force.mag();

        distance = constrain(distance, 5.0, 25.0); // エンが制御不能にならないように距離を制限

        force.normalize();

        float strength = (G * mass * m.mass) / (distance * distance) * -1;

        return force;
    }


    PVector repel(Mover m) {
        PVector force = PVector.sub(location,m.location);             // Calculate direction of force
        float distance = force.mag();                                 // Distance between objects
        distance = constrain(distance,1.0,10000.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
        force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

        float strength = (G * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
        force.mult(-1*strength);                                      // Get force vector --> magnitude * direction
        return force;
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

