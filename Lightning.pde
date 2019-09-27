int prevX = width / 2, prevY = 0, newX, newY;



void setup()
{
  size(300,300);
  background(0);
}
void draw()
{
	stroke(255, 255, 0);
	if (prevY < height) {
		newX = prevX + (int)(Math.random() * 40 + (mouseX - prevX) / 4);
		newY = prevY + (int)(Math.random() * 20);
		line(prevX, prevY, newX, newY);
		prevX = newX;
		prevY = newY;
	}
}
void mousePressed()
{
	prevX = width / 2;
	prevY = 0;
}

