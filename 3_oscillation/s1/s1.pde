/**
 * 加速度の対話的処理
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;

float angle = 5;
float aVelocity = 0;
float aAcceleration = 0.001;

void setup () {
    //config
    size(stageWid, stageHei);

    background(255);


    pushMatrix();

    // 移動
    // translate(25, 25);

    // 回転
    rotate(angle);

    // 拡縮
    scale( 1.2 );

    ellipse(25, 25, 10, 10);
    ellipse(100, 25, 10, 10);
    line(25, 25, 100, 25);

    popMatrix();

}



void draw () {
    background(255);


    pushMatrix();

    // 移動
    translate(150, 150);

    // 回転
    rotate( angle );

    // 拡縮
    scale( 1.2 );

    ellipse(25, 25, 10, 10);
    ellipse(100, 25, 10, 10);
    line(25, 25, 100, 25);

    popMatrix();


    aVelocity += aAcceleration;
    angle += aVelocity;

}
