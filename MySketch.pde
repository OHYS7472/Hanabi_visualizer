import processing.core.*;
import java.util.ArrayList;

// 이미지가 나타나기까지 5초 정도의 시간이 걸립니다. cpu와 gpu 성능에 따라 달라짐! 


public class MySketch extends PApplet {

    PImage img;
    ArrayList<PVector> points = new ArrayList<PVector>();

    public void settings() {
        img = loadImage("/Users/oyeoseul/Desktop/processing/MySketch/Bloom aesthetic.jpeg");
        size(img.width, img.height);
    }

    public void setup() {
        background(255);
        float newCanvasX = (width - img.width) / 2.0f;
        float newCanvasY = (height - img.height) / 2.0f;
        surface.setLocation((int) newCanvasX, (int) newCanvasY);

        // 이미지 내의 모든 픽셀 좌표를 저장
        for (int col = 0; col < img.width; col++) {
            for (int row = 0; row < img.height; row++) {
                points.add(new PVector(col, row));
                
     
            }
        }
    }

    
    public void draw() {
    background(255);

    // 좌표를 랜덤워커로 이동하면서 그리기 명령 실행
    for (int i = 0; i < points.size(); i++) {
        PVector point = points.get(i);
        float xPos = point.x + random(-30, 30);
        float yPos = point.y + random(-30, 30);
        int c = img.get((int) xPos, (int) yPos);
        push();
        translate(xPos, yPos);
        rotate(radians(random(360)));
       

        noFill();
        stroke(c);
        strokeWeight(random(5));
        point(0, 0);
        strokeWeight(random(3));
        float x1 = random(-80, 10);
        float y1 = random(-60, 20);
        float x2 = sin(xPos + random(60)) * random(60);
        float y2 = cos(xPos + random(60)) * sin(xPos + random(90)) * random(90);
        float x3 = random(-70, 10);
        float y3 = random(-10, 30);
        float x4 = cos(yPos + random(140)) * sin(yPos + random(90)) * random(140);
        float y4 = cos(xPos + random(60)) * sin(xPos + random(50)) * 50;
        curve(x1, y1, x2, y2, x3, y3, x4, y4);
        pop();
    }
}


    public static void main(String[] args) {
        PApplet.main("MySketch");
    }
}
