import java.util.Random;
Random posGenerator;



// Walker w;
int walkerLength = 1;
Walker[] walkArr = new Walker[walkerLength];

int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;




void setup () {
    //config
    size(stageWid, stageHei);

    posGenerator    = new Random();

    for(int cnt=0; cnt < walkerLength; cnt++) {
        walkArr[cnt] = new Walker();
    }
}





float t = 3;
void draw() {


    float x = noise(t);
    println("x: "+x);
    ellipse(t*10, x* 200, 16, 16);


    t += 0.1;
    // t += 0.05;
    // t += 0.02;
    // t += 0.01;
    // t += 0.001;



    // for(int cnt=0; cnt < walkerLength; cnt++) {
    //     walkArr[cnt].step();
    //     walkArr[cnt].display();
    // }

}

class Walker {
    float x;
    float y;

    Walker() {
        x = stageSize/2;
        y = stageSize/2;
    }


    void display() {

        stroke(1);
        point(x, y);

    }

    void step() {


        float stepsize = montecarlo(0, 15);

        float stepx = random( -stepsize, stepsize );
        float stepy = random( -stepsize, stepsize );

        x += stepx;
        y += stepy;

        println("noise(): "+noise(3));
        // println("montecarlo(): "+montecarlo(0, 10));

    }

    // モンテカルロ法
    float montecarlo(float min, float max) {
        while (true) {
            // ランダム値を選びます R1の定義
            float r1 = random(min, max);

            // R1を仕様するかどうかの判定する確率Pの計算
            float probability = r1;

            // 別のランダム値 R2 を選びます
            float r2 = random(min, max);

            // R2がP以上である場合、手順１に戻ってもう一度やり直します。
            // そうでなければr1の値を戻り値で返す
            if ( r2 < probability ) {
                return r1;

            }
        }
    }

}


