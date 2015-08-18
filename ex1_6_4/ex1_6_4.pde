import java.util.Random;
Random posGenerator;



// // Walker w;
// int walkerLength = 30;
// Walker[] walkArr = new Walker[walkerLength];

int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;




void setup () {
    //config
    size(stageWid, stageHei);

}



float offNum = 0.03;
float drowCycle = 0.1;

void draw() {

    loadPixels();


    // 横軸設定
    float xoff = 0.0;
    for ( int x = 0; x < width; x++) {

        // 縦軸設定
        // 縦に対して順々に描画の色設定をしてく
        float yoff = 0.0;
        for ( int y = 0; y < height; y++) {
            // 完全ランダム
            // float bright = random(255);

            // 模様っぽい？
            // float bright = map(noise(x, y), 0, 1, 0, 255);

            // Exercise1.10
            // ノイズに第3引数与えてアニメーションさせる
            float bright = map(noise(xoff, yoff, drowCycle), 0, 1, 0, 255);



            pixels[x+y*width] = color(bright);


            yoff += offNum;
        }
        xoff += offNum;
    }

    updatePixels();


    drowCycle += 0.03;


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


