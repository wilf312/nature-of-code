/**
 * 加速度の対話的処理
 */
int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;

Mover[] m;
int moverLen = 8;

void setup () {
    //config
    size(stageWid, stageHei);
    float sizex = 300.0;
    float sizey = 30.0;
    int pointx = 50;
    int pointy = 50;
    float rad = 360.0 / moverLen;

    m = new Mover[moverLen];

    for(int cnt=0; cnt<moverLen; cnt++) {
        m[cnt] = new Mover( sizex,sizey,pointx,pointy, radians(rad * cnt) );
    }
}



void draw () {

    background(255);

    for(int cnt=0; cnt<m.length;cnt++) {
        m[cnt].display();
    }

}
