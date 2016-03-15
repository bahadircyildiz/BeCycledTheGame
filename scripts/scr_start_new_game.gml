// scr_start_new_game(); (no parameters)
// Called to reset variables when restarting a game
score = 0;
lives = 3;
health = 100;
global.level_score = 0;     // reset level score
global.last_saved = 0;      // last saved score
global.level = 1;           // current level
global.item_max = 5;        // max (ending) item (image) number
global.item_min = 0;        // min (starting) item (image) number
global.instructions = true; // show instructions at start
global.loaded = 0;          // true if loading a saved game
global.setup = 0;

