import java.util.Arrays;

int prevX = width / 2, prevY = 0, newX, newY;

int cloudShift = 0;

ArrayList<ArrayList<Integer>> cloudPositions = new ArrayList<ArrayList<Integer>>();

void setup()
{
  size(300,300);
  background(0);

  //clouds
	for (int i = 0; i < width + 20; i += (int)(Math.random() * 10)) {
		ArrayList<Integer> innerList = new ArrayList<Integer>();
		cloudPositions.add(innerList);

						//x              ,        y
		innerList.addAll(Arrays.asList(i, (int)(Math.random() * 20 - 10),
			//width             ,  height             ,    color
			(int) random(15, 40), (int) random(15, 25), (int) random(50, 100)));
}


}
void draw()
{	
	
	//draw clouds
	for (ArrayList cloudList : cloudPositions) {
		fill((int) cloudList.get(4));
		stroke((int) cloudList.get(4) - 5);
		int x = (int)cloudList.get(0) + cloudShift;
//		while (x < 0) x = width - x;
		ellipse(x, (int) cloudList.get(1), (int) cloudList.get(2), (int) cloudList.get(3));
	}

	stroke(255, 255, 0);
	if (prevY < height) {
		//System.out.println(mouseX);
		float shift = (mouseX - prevX) / 3. - 10;
		//System.out.println(shift);

		newX = prevX + (int)(Math.random() * 30 + shift);
		// System.out.println(newX + "\n");
		newY = prevY + (int)(Math.random() * 20);
		line(prevX, prevY, newX, newY);
		prevX = newX;
		prevY = newY;
	}


	//cloudShift++;
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
