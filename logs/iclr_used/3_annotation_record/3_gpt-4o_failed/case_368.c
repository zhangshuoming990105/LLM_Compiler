
char* DVBGenreCode( unsigned char code )
{
 char *p="";
 switch ( code ) {

 case 0x00: p="";break;
 case 0x10: p="Movie/drama"; break;
  case 0x11: p="Detective/thriller"; break;
  case 0x12: p="Adventure/western/war"; break;
  case 0x13: p="Sci-Fi/fantasy/horror"; break;
  case 0x14: p="Comedy"; break;
  case 0x15: p="Soap/melodrama/folkloric"; break;
  case 0x16: p="Romance"; break;
  case 0x17: p="Serious/classical/religious/historical movie/drama"; break;
  case 0x18: p="adult movie"; break;


  case 0x20: p="New"; break;
  case 0x21: p="weather"; break;
  case 0x22: p="magazine"; break;
  case 0x23: p="magazine"; break;
  case 0x24: p="discussion/interview/debate"; break;


  case 0x30: p="Show"; break;
  case 0x31: p="Game/quiz/contest"; break;
  case 0x32: p="variety"; break;
  case 0x33: p="talk show"; break;


  case 0x40: p="Sports"; break;
  case 0x41: p="Sports special events"; break;
  case 0x42: p="sports magazines"; break;
  case 0x43: p="Football/soccer"; break;
  case 0x44: p="Tennis/squash"; break;
  case 0x45: p="team sports"; break;
  case 0x46: p="Athletics"; break;
  case 0x47: p="Motorcycle Racing"; break;
  case 0x48: p="Water sport"; break;
  case 0x49: p="Winter sports"; break;
  case 0x4A: p="Equestrian"; break;
  case 0x4B: p="Martial sports"; break;


  case 0x50: p="Children"; break;
  case 0x51: p="Pre-school children's programmes"; break;
  case 0x52: p="Kids 6-14"; break;
  case 0x53: p="Kids 10-16"; break;
  case 0x54: p="Informational/educational/school programmes"; break;
  case 0x55: p="Cartoons/puppets"; break;


  case 0x60: p="Music"; break;
  case 0x61: p="Rock/Pop"; break;
  case 0x62: p="classical music"; break;
  case 0x63: p="folk/traditional music"; break;
  case 0x64: p="Jazz"; break;
  case 0x65: p="Opera/Musical"; break;
  case 0x66: p="Ballet"; break;


  case 0x70: p="Art"; break;
  case 0x71: p="Performing"; break;
  case 0x72: p="Fine arts"; break;
  case 0x73: p="Religion"; break;
  case 0x74: p="Popular culture/traditional arts"; break;
  case 0x75: p="Literature"; break;
  case 0x76: p="Film/Cinema"; break;
  case 0x77: p="Experimental film/video"; break;
  case 0x78: p="Broadcasting/press"; break;
  case 0x79: p="New media"; break;
  case 0x7A: p="Arts/Culture magazines"; break;
  case 0x7B: p="fashion"; break;

  case 0x80: p="Social/political issues/Economics"; break;
  case 0x81: p="Magazines/reports/documentary"; break;
  case 0x82: p="Economics/Social advisory "; break;
  case 0x83: p="Remarkable people"; break;


  case 0x90: p="Education/Science/Factual"; break;
  case 0x91: p="Nature/animals/environment"; break;
  case 0x92: p="Technology/Natural sciences"; break;
  case 0x93: p="Medicine/physiology/psychology"; break;
  case 0x94: p="Foreign countries/expeditions"; break;
  case 0x95: p="Social/spiritual sciences"; break;
  case 0x96: p="Further education"; break;
  case 0x97: p="Languages"; break;


  case 0xa0: p="Leisure Hobbies"; break;
  case 0xa1: p="Travel"; break;
  case 0xa2: p="Handicraft"; break;
  case 0xa3: p="Motoring"; break;
  case 0xa4: p="Fitness"; break;
  case 0xa5: p="Cooking"; break;
  case 0xa6: p="Advertisement/shopping"; break;
  case 0xa7: p="gardening"; break;


  case 0xb0: p="Original language"; break;
  case 0xb1: p="Black and white"; break;
  case 0xb2: p="Unpublished"; break;
  case 0xb3: p="Live broadcast"; break;
 default: p=""; break;
 }
 return p;
}