
int stageWid = 500;
int stageHei = 500;

Walker w;


void setup () {
    //config
    size(stageWid, stageHei);

    smooth();

    w = new Walker();

}






void draw() {
    w.step();
    w.display();
}



class Walker {

    int x;
    int y;
    float r1;
    float r2;
    float r3;

    // 初期化
    Walker() {
        // 座標の中央に置く
        x = width/2;
        y = height/2;

        r1 = random(1);
        r2 = random(r1, 1);
        r3 = random(r2, 1);
    }

    void display() {

        stroke(0);

        point(x,y);
    }

    void step() {

        float r = random(1);



        if ( r < r1 ) {
            x++;

        }
        else if ( r < r2 ) {
            x--;

        }
        else if ( r < r3 ) {
            y++;
        }
        else {
            y--;

        }


    }


}
