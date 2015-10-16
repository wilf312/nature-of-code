/**
 * 加速度の対話的処理
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;


void setup () {
    //config
    size(stageWid, stageHei);

    background(255);




    // fill(#ff0000, 127);
    // noStroke();
    // rect(25, 25, 50, 50);

    // fill(#00ff00, 127);
    // noStroke();

    pushMatrix();

    // 移動
    // translate(25, 25);

    // 回転
    rotate(radians(45));

    // 拡縮
    scale( 5 );

    ellipse(25, 25, 10, 10);
    ellipse(100, 25, 10, 10);
    line(25, 25, 100, 25);

    popMatrix();



}


