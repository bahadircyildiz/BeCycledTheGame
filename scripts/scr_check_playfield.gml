// scr_check_playfield(across,down,size)
// Returns the number of matches

var gridx, gridy, size, vmatch, hmatch, iii, nnn;

gridx = argument0;
gridy = argument1;
size = argument2;
hmatch = 0;
vmatch = 0;
ctr = 0;

/* Start of rows checking */
for(gy=y; gy<y+(gridy*size); gy+=size){
  for(gx = x; gx<x+(gridx*size); gx+=size){
    // fetch first target instance
    nnn = instance_position(gx,gy,obj_items)
    if(nnn > 0){
      ctr = 1; // the target will always match with itself.
      match_count[0] = nnn; // so store target in array index 0;
      iii = instance_position(gx+size,gy,obj_items);
      // loop until there is no match
      while (iii > 0){
        if(iii.image_index == nnn.image_index){
          // We have a match so store the instance ID
          match_count[ctr] = iii;
          ctr +=1;
          gx += size;
          iii = instance_position(gx+size,gy,obj_items);
        }else{
          // no (more) matches so break out to save time.
          break;
        }
      }
      if(ctr > 2){
        hmatch += 1;
        for(i=0; i<ctr; i+=1){
          // set the matched variable in all matching instances
          match_count[i].matched = ctr;
          match_count[i] = 0;
        }
      }
    }
  }
}

/* Start of column check */
ctr = 0;
vmatch = 0;
for(gx = x; gx<x+(gridx*size); gx+=size){
  for(gy=y; gy<y+(gridy*size); gy+=size){
    // fetch first target instance
    nnn = instance_position(gx,gy,obj_items)
    if(nnn > 0){
      ctr = 1; // the target will always match with itself.
      match_count[0] = nnn; // so store target in array index 0;
      iii = instance_position(gx,gy+size,obj_items);
      // loop until there is no match
      while (iii > 0){
        if(iii.image_index == nnn.image_index){
          // We have a match
          match_count[ctr] = iii;
          ctr += 1;
          gy += size;
          iii = instance_position(gx,gy+size,obj_items);
        }else{
          break; // break out to save time.
        }
      }
      if(ctr > 2){
        vmatch += 1;     
        for(i=0; i<ctr; i+=1){
          // set the matched variable in all matching instances
          match_count[i].matched = ctr;
          match_count[i] = 0;
        }
      }
    }
  }
}
// return the number of 3 in a line matches;
return (hmatch+vmatch);

