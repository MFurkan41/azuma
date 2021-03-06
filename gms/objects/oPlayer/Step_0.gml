//Get Player Input
if (hascontrol)
{
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));

	if (key_left) or (key_right) or (key_jump)
	{
		controller = 0;
	}
       
	if (abs(gamepad_axis_value(0,gp_axislh) > 0.2))
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
	}

	//Caulculate Movement
	var move = key_right - key_left;

	hsp = move * walksp;

	vsp = vsp + grv;
	if (place_meeting(x,y+1,oWall)) && (key_jump)
	{
		vsp = -7;
	}

}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

//Animation
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index=1 else image_index = 0;

}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayer;		
	
	}
	else
	{
		sprite_index = sPlayerR;
		
	}
}
//Sprite Direction
if (hsp != 0) image_xscale=sign(hsp);
if(mouse_x > x) image_xscale = 1; else image_xscale = -1;










