/// @desc ScreenShake(magnitude,frames)
/// @arg Magnitude sets the strength of the shake (radius in pixels)
/// @arg Frames sets the length of the shake in frames (60 - 1 second at 60 fps)
function ScreenShake(magnitude,frames){
	with (oCamera)
	{
		if (magnitude > shake_remain)
		{ 
			shake_magnitude = magnitude;
			shake_remain = magnitude;
			shake_length = frames;
		}
	}
		
}