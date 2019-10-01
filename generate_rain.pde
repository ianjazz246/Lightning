void generateRain() {
	size(300, 300);

	for (int i = 0; i < 320; i+=20) {
		for (int j = 0; j < 320; j+=20) {
			int x = (int)(i + random(-4, 4));
			int y = (int)(j + random(-4, 4));
			strokeWeight(3);
			stroke(103, 122, 143);
			line(x, y, x, y + 8);
		}
	}
	save("rain.png");
}
