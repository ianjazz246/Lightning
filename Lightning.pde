import java.util.Arrays;

int prevX = width / 2, prevY = 0, newX, newY;
int rainX = 0, rainY = 0;

int cloudShift = 0;

PGraphics lightningGraphic;

PImage rainImage;

ArrayList<ArrayList<Integer>> cloudPositions = new ArrayList<ArrayList<Integer>>();

void setup()
{
  size(300,300);
  background(0);

  lightningGraphic = createGraphics(300, 300);

  //generateRain();
  rainImage = loadImage("rain.png");

  //setup clouds
	for (int i = 0; i < width + 20; i += (int)(Math.random() * 8)) {
		ArrayList<Integer> innerList = new ArrayList<Integer>();
		cloudPositions.add(innerList);

						//x              ,        y
		innerList.addAll(Arrays.asList(i, (int)(Math.random() * 20 + 5),
			//width                        ,  height                        ,    color
			(int) (Math.random() * 25 + 15), (int) (Math.random() * 20 + 10), (int) (Math.random() * 50 + 50)));
}


}
void draw()
{		
	background(0);



	lightningGraphic.beginDraw();
	//lightningGraphic.background(0, 0, 0, 240);
	lightningGraphic.strokeWeight(2);
	if (prevY < height) {
		//System.out.println(mouseX);
		float shift = (mouseX - prevX) / 3. - 10;
		//System.out.println(shift);

		newX = prevX + (int)(Math.random() * 30 + shift);
		// System.out.println(newX + "\n");
		newY = prevY + (int)(Math.random() * 20);

		//halo glow
		lightningGraphic.stroke(208, 198, 243);
		lightningGraphic.strokeWeight(4);
		lightningGraphic.line(prevX, prevY, newX, newY);

		//main bolt
		lightningGraphic.stroke(255, 255, 255);
		lightningGraphic.strokeWeight(1);
		lightningGraphic.line(prevX, prevY, newX, newY);

		prevX = newX;
		prevY = newY;
	}
	lightningGraphic.endDraw();

	image(lightningGraphic, 0, 0);



	//rain
	image(rainImage, rainX, rainY);
	image(rainImage, rainX, rainY - height);
	rainY = (rainY + 1) % height;


	//draw clouds
	for (ArrayList cloudList : cloudPositions) {
		fill((int) cloudList.get(4));
		stroke((int) cloudList.get(4) - 5);
		int x = ((int)cloudList.get(0) + cloudShift) % (width+20);
//		while (x < 0) x = width - x;
		ellipse(x, (int) cloudList.get(1), (int) cloudList.get(2), (int) cloudList.get(3));
	}
	cloudShift++;




}
void mousePressed()
{
	prevX = width / 2;
	prevY = 0;
}

void keyPressed()
{
	background(0);
}
