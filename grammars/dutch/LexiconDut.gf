--# -path=.:../common:../abstract:../../prelude

-- work by Aarne Ranta

concrete LexiconDut of Lexicon = CatDut ** 
  open Prelude, ParadigmsDut, IrregDut in {

flags 
  coding=utf8 ;
  optimize=all_subs ;

lin
  add_V3 = mkV3 (mkV "toe" (mkV "voegen")) (mkPrep "aan") ;
  already_Adv = mkAdv "al" ;
  answer_V2S = mkV2S (mkV "antwoorden") noPrep ;
  ask_V2Q = mkV2Q vragen_V noPrep ;
  bad_A = mkA "slecht" ;
  beautiful_A = mkA "mooi" ;
  become_VA = mkVA worden_V ;
  beer_N = mkN "bier" "bieren" neuter ;
  beg_V2V = mkV2V (mkV "smeken") noPrep ; ---- om te
  big_A = mkA "groot" ;
  bike_N = mkN "fiets" ;
  black_A = mkA "zwart" ;
  blue_A = mkA "blauw";
  book_N = mkN "boek" ;
  brother_N2 = mkN2 (mkN "broer" "broers" masculine) van_Prep ;
  brown_A = mkA "bruin" ;
  buy_V2 = mkV2 (mkV "kopen" "kocht" "gekocht") ;
  child_N = mkN "kind" "kinderen" neuter ;
  come_V = zijnV (mkV "kom" "komt" "komen" "kwam" "kwamen" "gekomen") ;
  die_V = zijnV (mkV "sterven" "stierf" "gestorven") ;
  distance_N3 = mkN3 (mkN "afstand") van_Prep (mkPrep "naar") ;
  drink_V2 = mkV2 drinken_V ;
  easy_A2V = mkA2 (mkA "gemakkelijk") noPrep ;
  eat_V2 = mkV2 eten_V ;
  father_N2 = mkN2 (mkN "vader") van_Prep ;
  fear_VS = mkVS (mkV "vrezen") ;
  fish_N = mkN "vis" ;
  go_V = zijnV gaan_V ;
  hope_VS = mkVS (mkV "hopen") ;
  house_N = mkN "huis" neuter ;
  know_VQ = mkVQ weten_V ;
  know_VS = mkVS weten_V ;
  married_A2 = mkA2 (mkA "getrouwd") (mkPrep "met") ;
  mother_N2 = mkN2 (mkN "moeder") ;
  now_Adv = mkAdv "nu" ;
  paint_V2A = mkV2A (mkV "schilderen" "schildert") ;
  paris_PN = mkPN "Parijs" ;
  red_A = mkA "rood" ;
  say_VS = mkVS zeggen_V ;
  see_V2 = mkV2 zien_V ;
  sell_V3 = mkV3 (mkV "verkopen" "verkocht" "verkocht") ;
  send_V3 = mkV3 (mkV "sturen") (mkPrep "naar") ;
  sleep_V = slapen_V ;
  small_A = mkA "klein" ;
  talk_V3 = mkV3 (mkV "praten") (mkPrep "met") (mkPrep "over") ;
  warm_A = mkA "warm" ;
  wine_N = mkN "wijn" ;
  john_PN = mkPN "Jan" ;
  left_Ord = mkOrd (invarA "linker") ; ----
  right_Ord = mkOrd (invarA "rechter") ; ----
  today_Adv = mkAdv "vandaag" ;
  far_Adv = mkAdv "ver" ;
  give_V3 = mkV3 geven_V ;
  wonder_VQ = mkVQ (reflV (mkV "af" vragen_V)) ;
airplane_N = mkN "vliegtuig" neuter ;
animal_N = mkN "dier" neuter ;
apartment_N = mkN "appartement" neuter ;
apple_N = mkN "appel" utrum ;
art_N = mkN "kunst" utrum ;
ashes_N = mkN "as" utrum ;
baby_N = mkN "baby" utrum ;
back_N = mkN "achterkant" utrum ;
bank_N = mkN "bank" utrum ;
bark_N = mkN "schors" utrum ;
belly_N = mkN "buik" utrum ;
bird_N = mkN "vogel" utrum ;
bite_V2 = mkV2 bijten_V ;
black_A = mkA "zwart" ;
blood_N = mkN "bloed" neuter ;
blow_V = blazen_V ;
boat_N = mkN "boot" utrum ;
bone_N = mkN "bot" neuter ;
boot_N = mkN "boot" utrum ;
boss_N = mkN "baas" utrum ;
boy_N = mkN "jongen" utrum ;
bread_N = mkN "brood" neuter ;
break_V2 = mkV2 breken_V ;
breast_N = mkN "borst" utrum ;
breathe_V = mkV "ademen" ;
broad_A = mkA "breed" ;
burn_V = mkV "branden" ;
butter_N = mkN "boter" utrum ;
camera_N = mkN "camera" utrum ;
cap_N = mkN "kap" utrum ;
car_N = mkN "auto" utrum ;
carpet_N = mkN "tapijt" neuter ;
cat_N = mkN "kat" utrum ;
ceiling_N = mkN "plafond" neuter ;
chair_N = mkN "stoel" utrum ;
cheese_N = mkN "kaas" utrum ;
church_N = mkN "kerk" utrum ;
city_N = mkN "stad" "steden" utrum ;
clean_A = mkA "schoon" ;
clever_A = mkA "slim" ;
close_V2 = mkV2 sluiten_V ;
cloud_N = mkN "wolk" utrum ;
coat_N = mkN "vacht" utrum ;
cold_A = mkA "koud" ;
computer_N = mkN "computer" utrum ;
correct_A = mkA "correct" ;
count_V2 = mkV2 "rekenen" ;
country_N = mkN "land" neuter ;
cousin_N = mkN "neef" utrum ;
cow_N = mkN "koe" utrum ;
cut_V2 = mkV2 snijden_V ;
day_N = mkN "dag" utrum ;
dig_V = graven_V ;
dirty_A = mkA "vuil" ;
do_V2 = mkV2 doen_V ;
doctor_N = mkN "arts" utrum ;
dog_N = mkN "hond" utrum ;
door_N = mkN "deur" utrum ;
dry_A = mkA "droog" ;
dull_A = mkA "saai" ;
dust_N = mkN "stof" neuter ;
ear_N = mkN "oor" neuter ;
earth_N = mkN "aarde" utrum ;
egg_N = mkN "ei" neuter ;
empty_A = mkA "leeg" ;
enemy_N = mkN "vijand" utrum ;
eye_N = mkN "oog" neuter ;
factory_N = mkN "fabriek" utrum ;
fall_V = vallen_V ;
fat_N = mkN "vet" neuter ;
fear_V2 = mkV2 "vrezen" ;
feather_N = mkN "veer" utrum ;
fight_V2 = mkV2 vechten_V ;
find_V2 = mkV2 vinden_V ;
fingernail_N = mkN "vingernagel" utrum ;
fire_N = mkN "brand" utrum ;
float_V = drijven_V ;
floor_N = mkN "vloer" utrum ;
flow_V = mkV "stromen" ;
flower_N = mkN "bloem" utrum ;
fly_V = vliegen_V ;
fog_N = mkN "mist" utrum ;
foot_N = mkN "voet" utrum ;
forest_N = mkN "bos" neuter ;
forget_V2 = mkV2 vergeten_V ;
freeze_V = vriezen_V ;
fridge_N = mkN "koelkast" utrum ;
friend_N = mkN "vriend" utrum ;
fruit_N = mkN "vrucht" utrum ;
full_A = mkA "vol" ;
fun_AV = mkA "leuk" ;
garden_N = mkN "tuin" utrum ;
girl_N = mkN "meisje" neuter ;
glove_N = mkN "handschoen" utrum ;
gold_N = mkN "goud" neuter ;
good_A = mkA "goed" "goede" "goeds" "beter" "best" ;
grammar_N = mkN "grammatica" utrum ;
grass_N = mkN "gras" neuter ;
green_A = mkA "groen" ;
guts_N = mkN "darm" utrum ;
hair_N = mkN "haar" neuter ;
hand_N = mkN "hand" utrum ;
harbour_N = mkN "haven" utrum ;
hat_N = mkN "hoed" utrum ;
hate_V2 = mkV2 "haten" ;
head_N = mkN "hoofd" neuter ;
hear_V2 = mkV2 "horen" ;
heart_N = mkN "hart" neuter ;
heavy_A = mkA "zwaar" ;
hill_N = mkN "heuvel" utrum ;
hit_V2 = mkV2 "raken" ;
hold_V2 = mkV2 houden_V ;
horn_N = mkN "hoorn" utrum ;
horse_N = mkN "paard" neuter ;
hot_A = mkA "heet" ;
hunt_V2 = mkV2 "jagen" ;
husband_N = mkN "man" utrum ;
ice_N = mkN "ijs" neuter ;
important_A = mkA "belangrijk" ;
industry_N = mkN "industrie" "industrieën" utrum ;
iron_N = mkN "ijzer" neuter ;
jump_V = springen_V ;
kill_V2 = mkV2 "dooden" ;
king_N = mkN "koning" utrum ;
knee_N = mkN "knie" utrum ;
know_V2 = mkV2 "kennen" ;
lake_N = mkN "meer" neuter ;
lamp_N = mkN "lamp" utrum ;
language_N = mkN "taal" utrum ;
laugh_V = lachen_V ;
leaf_N = mkN "blad" neuter ;
learn_V2 = mkV2 "leren" ;
leather_N = mkN "leer" neuter ;
leave_V2 = mkV2 (mkV "verlaten" "verliet" "verlieten" "verlaten") ;
leg_N = mkN "been" neuter ;
lie_V = liggen_V ;
like_V2 = mkV2 (partV (mkV "vinden") "leuk") ;
listen_V2 = mkV2 "luisteren" ;
live_V = mkV "leven" ;
liver_N = mkN "lever" utrum ;
long_A = mkA "lang" ;
lose_V2 = mkV2 verliezen_V ;
louse_N = mkN "luis" utrum ;
love_N = mkN "liefde" utrum ;
love_V2 = mkV2 houden_V van_Prep ;
man_N = mkN "man" utrum ;
meat_N = mkN "vlees" neuter ;
milk_N = mkN "melk" utrum ;
moon_N = mkN "maan" utrum ;
mountain_N = mkN "berg" utrum ;
mouth_N = mkN "mond" utrum ;
music_N = mkN "muziek" utrum ;
name_N = mkN "naam" utrum ;
narrow_A = mkA "smal" ;
near_A = mkA "nabij" ;
neck_N = mkN "nek" utrum ;
new_A = mkA "nieuw" ;
newspaper_N = mkN "krant" utrum ;
night_N = mkN "nacht" utrum ;
nose_N = mkN "neus" utrum ;
number_N = mkN "nummer" neuter ;
oil_N = mkN "olie-schakelaars" utrum ;
old_A = mkA "oud" ;
open_V2 = mkV2 "openen" ;
paper_N = mkN "papier" neuter ;
peace_N = mkN "vrede" utrum ;
pen_N = mkN "pen" utrum ;
person_N = mkN "persoon" utrum ;
planet_N = mkN "planeet" utrum ;
plastic_N = mkN "plastic" utrum ;
play_V = mkV "spelen" ;
play_V2 = mkV2 "spelen" ;
policeman_N = mkN "politieagent" utrum ;
priest_N = mkN "priester" utrum ;
probable_AS = mkA "waarschijnlijk" ;
pull_V2 = mkV2 "trekken" ;
push_V2 = mkV2 "duwen" ;
put_V2 = mkV2 "zetten" ;
queen_N = mkN "koningin" utrum ;
question_N = mkN "vraag" utrum ;
radio_N = mkN "radio" utrum ;
rain_N = mkN "regen" utrum ;
rain_V0 = mkV "regen" "regent" "regenen" "regende" "regenden" "geregend" ; 
read_V2 = mkV2 lezen_V ;
ready_A = mkA "klaar" ;
reason_N = mkN "reden" utrum ;
-- red_A = mkA "rood" ;
religion_N = mkN "religie" utrum ;
restaurant_N = mkN "restaurant" neuter ;
river_N = mkN "rivier" utrum ;
road_N = mkN "weg" utrum ;
rock_N = mkN "rots" utrum ;
roof_N = mkN "dak" neuter ;
root_N = mkN "wortel" utrum ;
rope_N = mkN "touw" neuter ;
rotten_A = mkA "verrot" ;
round_A = mkA "rond" ;
rub_V2 = mkV2 wrijven_V ;
rubber_N = mkN "rubberen" utrum ;
rule_N = mkN "regel" utrum ;
run_V = zijnV (mkV "rennen") ;
salt_N = mkN "zout" neuter ;
sand_N = mkN "zand" neuter ;
school_N = mkN "school" utrum ;
science_N = mkN "wetenschap" utrum ;
scratch_V2 = mkV2 "krassen" ;
sea_N = mkN "zee" utrum ;
seed_N = mkN "zaad" neuter ;
seek_V2 = mkV2 zoeken_V ;
sew_V = mkV "naaien" ;
sharp_A = mkA "scherp" ;
sheep_N = mkN "schaap" neuter ;
ship_N = mkN "schip" neuter ;
shirt_N = mkN "shirt" neuter ;
shoe_N = mkN "schoen" utrum ;
shop_N = mkN "winkel" utrum ;
short_A = mkA "kort" ;
silver_N = mkN "zilver" neuter ;
sing_V = zingen_V ;
sister_N = mkN "zuster" utrum ;
sit_V = zitten_V ;
skin_N = mkN "huid" utrum ;
sky_N = mkN "lucht" utrum ;
smell_V = ruiken_V ;
smoke_N = mkN "rook" utrum ;
smooth_A = mkA "glad" ;
snake_N = mkN "slang" utrum ;
snow_N = mkN "sneeuw" utrum ;
sock_N = mkN "sok" utrum ;
song_N = mkN "liedje" neuter ;
speak_V2 = mkV2 spreken_V ;
spit_V = mkV "spugen" ;
split_V2 = mkV2 splijten_V ;
squeeze_V2 = mkV2 knijpen_V ;
stab_V2 = mkV2 steken_V ;
stand_V = staan_V ;
star_N = mkN "ster" utrum ;
steel_N = mkN "staal" neuter ;
stick_N = mkN "stok" utrum ;
stone_N = mkN "steen" utrum ;
stop_V = mkV "stoppen" ;
stove_N = mkN "kachel" utrum ;
straight_A = mkA "recht" ;
student_N = mkN "student" utrum ;
stupid_A = mkA "dom" ;
suck_V2 = mkV2 zuigen_V ;
sun_N = mkN "zon" utrum ;
swell_V = zwellen_V ;
swim_V = zwemmen_V ;
switch8off_V2 = mkV2 "schakelen" ;
switch8on_V2 = mkV2 (mkV "op" (mkV "schakelen")) ;
table_N = mkN "tabel" utrum ;
tail_N = mkN "staart" utrum ;
teach_V2 = mkV2 "leren" ;
teacher_N = mkN "leraar" utrum ;
television_N = mkN "televisie" utrum ;
thick_A = mkA "dik" ;
thin_A = mkA "dun" ;
think_V = denken_V ;
throw_V2 = mkV2 "gooien" ;
tie_V2 = mkV2 "banden" ;
tongue_N = mkN "tong" utrum ;
tooth_N = mkN "tand" utrum ;
train_N = mkN "trein" utrum ;
travel_V = mkV "reizen" ;
tree_N = mkN "boom" utrum ;
turn_V = mkV "draaien" ;
ugly_A = mkA "lelijk" ;
uncertain_A = mkA "onzeker" ;
understand_V2 = mkV2 (mkV "begrijpen" "begreep" "begrepen" "begrepen") ;
university_N = mkN "universiteit" utrum ;
village_N = mkN "dorp" neuter ;
vomit_V = mkV "braken" ;
wait_V2 = mkV2 (mkV "wachten") (mkPrep "op") ;
walk_V = mkV "lopen" ;
war_N = mkN "oorlog" utrum ;
wash_V2 = mkV2 wassen_V ;
watch_V2 = mkV2 kijken_V (mkPrep "naar") ;
water_N = mkN "water" neuter ;
wet_A = mkA "nat" ;
white_A = mkA "wit" ;
wide_A = mkA "breed" ;
wife_N = mkN "vrouw" utrum ;
win_V2 = mkV2 winnen_V ;
wind_N = mkN "wind" utrum ;
window_N = mkN "raam" neuter ;
wing_N = mkN "vleugel" utrum ;
wipe_V2 = mkV2 "vegen" ;
woman_N = mkN "vrouw" utrum ;
wood_N = mkN "hout" neuter ;
worm_N = mkN "worm" utrum ;
write_V2 = mkV2 schrijven_V ;
year_N = mkN "jaar" neuter ;
yellow_A = mkA "geel" ;
young_A = mkA "jong" ;

}
