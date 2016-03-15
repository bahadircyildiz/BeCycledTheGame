// scr_count_colors(across,size);
/*
    returns the number remaining of the least of an item type/color
    Creates more of that item to ensure at least 3 of each type exist.
*/
var rep, px, across, size, minleft, maxleft;

across = argument0;
size = argument1;
result = 0;
rep = 0;

for(i=global.item_min; i<global.item_max+1; i+=1){
  global.item[i] = 0; // zero counters
}
with (obj_items){
  global.item[col] += 1;
}
with (obj_block_top){
  other.result += extra;
}
maxleft = 0;
minleft = 0;
// Fetch minimum and maximum numbers of an items left
for(i=global.item_min; i<global.item_max+1; i+=1){
  if(global.item[i] > 0) {
    maxleft = max(maxleft,global.item[i]);
    if(minleft == 0){
      minleft = global.item[i];
    }else{
      minleft = min(minleft,global.item[i]);
    }
  }
}
// just exit if there are any extra items and at lest 1 match remains
if(result > 0 && maxleft < 3) {return 0;}
result = minleft;
// Add more items if there is just 1 or 2 left.
for(i=global.item_min; i<global.item_max+1; i+=1){
  if(global.item[i] > 0 && global.item[i] < 3){
    // Too few of one type to match
    rep = 3-global.item[i];
    audio_play_sound(snd_harp,0,false);
    tries = 0;
    while (rep > 0){
      px = (irandom_range(x,x+(across*size)) div(size))*size;
      if(!place_meeting(px,y,obj_items)){
        with (instance_create(px,y,obj_items)){
          col = other.i;
          image_index = col;
        }
        rep -= 1;
      }
      tries += 1;
      // Allow 30 tries max - (will do it again next time.)
      if(tries > 30){ rep -= 1;}
    }
    break;
  }
}

return (rep+result);

