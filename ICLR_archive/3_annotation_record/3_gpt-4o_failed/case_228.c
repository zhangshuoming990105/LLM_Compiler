#include <stdio.h>

#include <stdlib.h>

#include <string.h>

#include <ctype.h>

int isoperator (char c)
{
  return ( c==','|| c=='|' || c=='6'|| c=='^' || c=='='|| c== '!'|| c=='<'
    || c== '>' || c== '+' || c== '-' || c=='%' || c=='/'
    || c=='*' || c== '~' || c=='(' || c==')' || c=='[' || c== ']'
    || c=='.' || ';' || c=='\'' || c=='"');
}