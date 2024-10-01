
char * line_parser_old(char * file_line) {
 int size;
 int count;
 int pos;


 size = 0;
 while (*(file_line + size) != 0) {
  size++;
 }


 count = 0;

 do {

  if ((*(file_line + count) == 13) || (*(file_line + count) == 10) || (*(file_line + count) == ';')) {
   *(file_line + count) = ' ';
  }
  count++;
 } while (count < size);

 count = 0;
 do {
  {

   if (*(file_line + count) == '\'') {

    *(file_line + count) = ' ';
    count++;
    if (count == size) {
     break;
    }
    while (*(file_line + count) != '\'' && count < size) {
     *(file_line + count) = ' ';
     count++;
     if (count == size) {
      break;
     }
    }

    *(file_line + count) = ' ';


    if (count == size) {
     break;
    }
   } else {

    if (((*(file_line + count) >= '0') && (*(file_line + count) <= '9') && !((*(file_line + count - 1) >= 'a' && *(file_line + count - 1) <= 'z') || (*(file_line + count - 1) >= 'A' && *(file_line + count - 1) <= 'Z')))
     || ((*(file_line + count) == '-' || *(file_line + count) == '+' || *(file_line + count) == '*' || *(file_line + count) == '/' || *(file_line + count) == '.' || *(file_line + count) == ',') && (*(file_line + count + 1) >= '0') && (*(file_line + count + 1) <= '9'))) {
      while ((((*(file_line + count) >= '0') && (*(file_line + count) <= '9'))
       || ((*(file_line + count) == '-' || *(file_line + count) == '.' || *(file_line + count) == ','))) && (count < size)) {
        *(file_line + count) = ' ';
        count++;
        if (count == size) {
         break;
        }
       }

     }
   }
  }
  count++;
 } while (count < size);



 size = 0;
 while (*(file_line + size) != 0) {
  size++;
 }

 pos = 0;
 count = 0;
 do {
  if (*(file_line + count) == ' ') {

   if (count > 0) {
    *(file_line + pos) = *(file_line + count);
    pos++;
   }
   while (*(file_line + count) == ' ' && count < size) {
    count++;
   }
  }
# 783 "/scratch/repos/new/home/jordi_armengol_estape/c-scraper/outputs/2022-01-22/02-19-57/repos/JoseCarlosFonseca/DBSniffer/refs/heads/master/src/parser.h"
  if ((*(file_line + count) >= 'A') && (*(file_line + count) <= 'Z')) {
   *(file_line + pos) = *(file_line + count) + 32;
  } else {
   *(file_line + pos) = *(file_line + count);
  }
  pos++;
  count++;
 } while (count < size);
 if (*(file_line + pos - 2) == ' ') {
  *(file_line + pos - 2) = '\0';
 }
 for (count = pos; count < size; count++) {
  *(file_line + pos) = '\0';
 }

 return (file_line);

}