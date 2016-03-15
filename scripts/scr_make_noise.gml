/// scr_make_noise() (No Params)
// selects and plays a sound effect
var sel1, sel2;

sel1 = choose(1,2);
sel2 = irandom(4);
/*if(sel2 < 3){
  if(sel2 == 2){
    if(!audio_is_playing(snd_giggle2)) {
      audio_play_sound(snd_giggle2,0,false);
    }
  }
  if(sel2 == 1){
    if(!audio_is_playing(snd_giggle1)) {
      audio_play_sound(snd_giggle1,0,false);
    }
  }
}*/
switch (sel1){
  case 1:
    if(!audio_is_playing(snd_glass1)) {
      audio_play_sound(snd_glass1,0,false);
    }else{
      if(!audio_is_playing(snd_glass2)) {
        audio_play_sound(snd_glass2,1,false);
      }
    }
  break;
  case 2:
    if(!audio_is_playing(snd_glass2)) {
      audio_play_sound(snd_glass2,0,false);
    }//else{
     // if(!audio_is_playing(snd_giggle1)) {
      //  audio_play_sound(snd_giggle1,1,false);
     // }
   // }
}

