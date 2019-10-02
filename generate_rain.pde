void generateRain() {
	PGraphics pg = createGraphics(300, 300);
	
	pg.beginDraw();

	for (int i = 0; i < 320; i+=20) {
		for (int j = 0; j < 320; j+=20) {
			int x = (int)(i + random(-4, 4));
			int y = (int)(j + random(-4, 4));
			pg.strokeWeight(3);
			pg.stroke(103, 122, 143);
			pg.line(x, y, x, y + 8);
		}
	}

	pg.endDraw();
	pg.save("rain.png");
}
