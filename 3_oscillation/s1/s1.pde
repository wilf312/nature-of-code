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

    fill(#ff0000, 127);
    noStroke();
    rect(25, 25, 50, 50);

    fill(#00ff00, 127);
    noStroke();

    pushMatrix();

    // 移動
    translate(25, 25);

    // 回転
    rotate(radians(45));

    // 拡縮
    // scale(2, 0.5);

    rect(-25, -25, 50, 50);

    popMatrix();



}


