import java.util.Arrays;

int prevX = width / 2, prevY = 0, newX, newY;
int rainX = 0, rainY = 0;

int flashColor = 0;

int cloudShift = 0;

PGraphics lightningGraphic;

PImage rainImage;

ArrayList<PShape> boltList = new ArrayList<PShape>();

ArrayList<ArrayList<Integer>> cloudPositions = new ArrayList<ArrayList<Integer>>();

void setup()
{
  size(300,300);
  background(0);

  lightningGraphic = createGraphics(300, 300);

  //generateRain();
  rainImage = loadImage("rain_edit.png");

  //setup clouds
	for (int i = 0; i < width + 20; i += (int)(Math.random() * 8)) {
		ArrayList<Integer> innerList = new ArrayList<Integer>();
		cloudPositions.add(innerList);

						//x              ,        y
		innerList.addAll(Arrays.asList(i, (int)(Math.random() * 20 + 5),
			//width                        ,  height                        ,    color
			(int) (Math.random() * 25 + 15), (int) (Math.random() * 20 + 10), (int) (Math.random() * 50 + 50)));
}

mousePressed();




}
void draw()
{		
	background(0);

	shape(boltList.get(0));

	// System.out.println(flashColor);



	lightningGraphic.beginDraw();

	for (PShape bolt : boltList) {
		System.out.println(bolt);
		lightningGraphic.shape(bolt);
	}

	// lightningGraphic.fill(0, 0, 0, 15);
	// lightningGraphic.rect(0, 0, width, height);
	// lightningGraphic.strokeWeight(2);


	/*while(prevY < height) {
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
		flashColor = 255;
	}*/
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

	flashColor = flashColor > 0 ? flashColor - 5 : flashColor;


}
void mousePressed()
{
	prevX = mouseX;
	prevY = 0;

	PShape bolt = createShape();
	bolt.beginShape();
	bolt.stroke(255);
	bolt.strokeWeight(3);
	while(prevY < height) {
		//System.out.println(mouseX);
		float shift = (mouseX - prevX) / 3. - 10;
		//System.out.println(shift);

		newX = prevX + (int)(Math.random() * 30 + shift);
		// System.out.println(newX + "\n");
		newY = prevY + (int)(Math.random() * 20);

		//halo glow
		// lightningGraphic.stroke(208, 198, 243);
		// lightningGraphic.strokeWeight(4);
		// lightningGraphic.line(prevX, prevY, newX, newY);

		//main bolt
		// lightningGraphic.stroke(255, 255, 255);
		// lightningGraphic.strokeWeight(1);
		// lightningGraphic.line(prevX, prevY, newX, newY);

		bolt.vertex(prevX, prevY, newX, newY);

		prevX = newX;
		prevY = newY;

	}
	bolt.endShape();
	bolt.setFill(color(255));
	bolt.setStroke(color(255));
	boltList.add(bolt);

	flashColor = 255;

}

void keyPressed()
{
	lightningGraphic.beginDraw();
	lightningGraphic.background(0);
	lightningGraphic.beginDraw();
}
