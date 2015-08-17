
int stageWid = 500;
int stageHei = 500;
Walker w;


void setup () {
    //config
    size(stageWid, stageHei);

    smooth();

    // background(0, 0, 0);


    w = new Walker();

}


class Walker {
    int x;
    int y;

    Walker() {
        x = width  / 2;
        y = height / 2;
    }

    void display () {
        stroke(0);
        point(x, y);
    }

    void step() {
        float stepX = random(-1, 3) ;
        float stepY = random(-1, 3) ;
        log(stepX);
        log(stepY);

        x += stepX;
        y += stepY;
    }
}






void draw() {

    w.step();
    w.display();

}






// ----------------- // ----------------- // ----------------- // -----------------


// int stageWid = 500;
// int stageHei = 500;


// void setup () {
//     //config
//     size(stageWid, stageHei);

//     smooth();

//     background(0, 0, 0);

// }






// void draw() {

//     refresh();


//     int column = 0;
//     int row    = 0;


//     //line color
//     noFill();
//     stroke(150, 150, 150);


//     for (int cnt=0; cnt < 100; cnt++) {

//         column = cnt % 10;
//         row    = cnt / 10;
//         println(cnt);

//         //circle
//         ellipse( ( 25 + column*50 ), ( 25 + row*50 ), 50, 50);

//         //box
//         rect(( column * 50 ), ( row * 50 ), 50, 50);

//         // small circle
//         ellipse(( (column+1) * 50 ), ( (row+1) * 50 ), 25, 25);

//     }



// }



// void refresh() {
//     fill(0, 0, 0);
//     rect(0, 0, stageWid, stageHei);

// }