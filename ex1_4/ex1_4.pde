import java.util.Random;
Random posGenerator;
Random colorGenerator;

int stageSize = 500;
int stageWid = stageSize;
int stageHei = stageSize;




void setup () {
    //config
    size(stageWid, stageHei);

    posGenerator    = new Random();
    colorGenerator  = new Random();

}






void draw() {
    float numx = (float) posGenerator.nextGaussian();
    float numy = (float) posGenerator.nextGaussian();
    float sd = 60;
    float mean = stageSize / 2;

    float x = sd * numx + mean;
    float y = sd * numy + mean;

    float[] numColor = new float[3];
    numColor[0] = (float) colorGenerator.nextGaussian();
    numColor[1] = (float) colorGenerator.nextGaussian();
    numColor[2] = (float) colorGenerator.nextGaussian();
    float sdColor = 60;
    float meanColor = 255 / 2;

    float[] colorArr = new float[3];

    colorArr[0] = sdColor * numColor[0] + meanColor;
    colorArr[1] = sdColor * numColor[1] + meanColor;
    colorArr[2] = sdColor * numColor[2] + meanColor;




    noStroke();
    fill(colorArr[0], colorArr[1], colorArr[2], 10);
    ellipse(x, y, 16, 16);


}



