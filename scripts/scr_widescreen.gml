// scr_widescreen(wide); (0 normal, 1 widescreen 2 Auto)
/*
    MUST be called from first (loader) room as it will 
    loop through all rooms, setting each to the required 
    settings. Assumes view sizes are constant.
    Returns true if set for widescreen false otherwise.
    
    Widescreen ratio is 16:9 height = width / (16/9)
    Normal ratio is 4:3 height = width / (4/3)
*/

var ww, hh, i, rm, ws1, ns, view, rprev, result;

ww = display_get_width();
hh = display_get_height();
// Set to use normal 4:3 ratio as default
ns = 4/3;
ww = 960;
hh = 640;
left = 0;
top = 0;
result = 0;
if(argument0 > 0){
  if(floor(hh*ns) > ww || argument0 == 1) { // width to height 
    // Set to use 16:9 ratio Widescreen
    ww = 960;
    hh = 640;
    left = 0;
    top = 0;
    result = 1;
  }
}
/////////////////////////////////////////
// loop through all rooms from this one
// and set the views to the display size
/////////////////////////////////////////
rm = room_next(room);
i = true;
while (i){
  // disable background7 in case we forgot.
  room_set_background(rm, 7, 0, 0, bg_screen_mask, 0, 0, 0, 0, 0, 0, 0);
  // set view0 to center the game
  room_set_view(rm, 0, true, left, top, ww, hh, 0, 0, ww, hh, 0, 0, -1, -1, -1);
  room_set_view_enabled(rm,true);
  // You can add further views here if required
  if (rm == room_last){
    i = false;
  }else{
    rprev = rm;
    rm = room_next(rprev);
  }
}
window_set_size(ww,hh);
if(VERSION > 1.2){
  surface_resize(application_surface,ww,hh); // versions 1.3
}
return (result);

