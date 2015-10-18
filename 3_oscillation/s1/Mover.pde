class Mover {

    float angle = 0;
    float aVelocity = 0;
    float aAcceleration = 0.001;

    float sizex;
    float sizey;
    int pointx;
    int pointy;

    float test = -1;

    Mover( float aSizex, float aSizey, int aPointx, int aPointy, float aAngle) {
        sizex = aSizex;
        sizey = aSizey;
        pointx = aPointx;
        pointy = aPointy;

        angle = aAngle;
    }


    void display () {

        pushMatrix();

        // 移動
        translate(pointx, pointy);
        // // 回転
        rotate( angle );
        // // 拡縮
        // scale( 1.2 );

        // 端回転
        // ellipse(0 , 0 , 10, 10);
        // ellipse(sizex, sizey, 10, 10);
        // line(0, 0, sizex, sizey);

        // 中央
        ellipse(0 - sizex / 2, 0 - sizey / 2 , 10, 10);
        ellipse(sizex - sizex / 2, sizey - sizey / 2, 10, 10);
        line(0 - sizex / 2, 0 - sizey / 2, sizex - sizex / 2, sizey - sizey / 2);

        popMatrix();


        aVelocity += aAcceleration;
        angle += aVelocity;


        sizex += test;
        sizey += test;




    }

}
