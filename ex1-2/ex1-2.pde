
int stageWid = 640;
int stageHei = 240;
int[] randomCounts;

void setup () {
    //config
    size(stageWid, stageHei);

    randomCounts = new int[20];

}




void draw() {
    background(255);

    int index =  int ( random(randomCounts.length) );
    randomCounts[index]++;

    int w = width / randomCounts.length;

    for ( int x = 0; x <  randomCounts.length; x++)  {


        rect(x*w, height-randomCounts[x], w-1, randomCounts[x]);
    }

}
