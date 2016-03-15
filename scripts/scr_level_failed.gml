/// Level failed script
/*
    Displays a level failed message using the text
    supplied in Argument0 as the heding text
*/
txt = argument0;
finished = true;
global.setup = false;
audio_sound_gain(snd_level1,0.5,1000);
with (instance_create(0,0,obj_lvl_over)){
  msg_txt = other.txt;
  lives -= 1;
  if(lives == 0){
    msg_txt += "##Hic canin kalmadi.";
    target_room = menu_room;
  }else{
    msg_txt += "##Seviye "+string(global.level)+" Tamamlanamadi! Skorun "+scr_add_commas(score)+"'a cekildi."; 
    msg_txt += "##Bir can kaybettin -  "+string(lives)+" canin kaldi";
    target_room = ad_room;
  }
}

