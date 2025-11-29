shader_type canvas_item;

uniform float threshhold;
uniform float multiplier;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if (1.0 - abs(UV.x - 0.5) * 2.0 > round(threshhold * multiplier) / multiplier)
	{
		COLOR.a = 0.0;
	}
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
