// scr_get_color(image_index)
// returns color of sprite image (used for effects only)
var result;

switch (argument0){
  case 0:
  case 6:
  case 8:
    result = c_red;
    break;
  case 1:
  case 3:
    result = c_yellow;
    break;
  case 2:
  case 9:
    result = c_orange;
    break;
  case 5:
    result = c_purple;
    break;
  default:
    result = c_green;
}
return (result);

