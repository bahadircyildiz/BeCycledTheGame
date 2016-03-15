// scr_add_commas(value);
/*
   Returns a string with commas as a thousands separator
   (Used to display scores)
*/
var strScore, n;

// Insure we have a string representation of the value.
if(!is_real(argument0)){
  strScore = argument0; // convert to string if real value specified
}else{
  strScore = string(argument0);
}
n = string_length(strScore)-2;
// Loop through the string in reverse order
while (n > 1) {
  strScore = string_insert(",",strScore,n);
  n -= 3;
}
return (strScore);

