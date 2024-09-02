#include <stdint.h>
#include <stdio.h>
typedef unsigned char u8;

typedef enum CORE_STATE {
  CORE_START = 0,
  CORE_INVALID,
  CORE_S1,
  CORE_S2,
  CORE_INT,
  CORE_FLOAT,
  CORE_EXPONENT,
  CORE_SCIENTIFIC,
  NUM_CORE_STATES
} core_state_e;

u8 ee_isdigit(u8 c);

enum CORE_STATE core_state_transition(u8 **instr, unsigned *transition_count) {
  u8 *str = *instr;
  u8 NEXT_SYMBOL;
  enum CORE_STATE state = CORE_START;
  for (; *str && state != CORE_INVALID; str++) {
    NEXT_SYMBOL = *str;
    if (NEXT_SYMBOL == ',') {
      str++;
      break;
    }
    switch (state) {
    case CORE_START:
      if (ee_isdigit(NEXT_SYMBOL)) {
        state = CORE_INT;
      } else if (NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-') {
        state = CORE_S1;
      } else if (NEXT_SYMBOL == '.') {
        state = CORE_FLOAT;
      } else {
        state = CORE_INVALID;
        transition_count[CORE_INVALID]++;
      }
      transition_count[CORE_START]++;
      break;
    case CORE_S1:
      if (ee_isdigit(NEXT_SYMBOL)) {
        state = CORE_INT;
        transition_count[CORE_S1]++;
      } else if (NEXT_SYMBOL == '.') {
        state = CORE_FLOAT;
        transition_count[CORE_S1]++;
      } else {
        state = CORE_INVALID;
        transition_count[CORE_S1]++;
      }
      break;
    case CORE_INT:
      if (NEXT_SYMBOL == '.') {
        state = CORE_FLOAT;
        transition_count[CORE_INT]++;
      } else if (!ee_isdigit(NEXT_SYMBOL)) {
        state = CORE_INVALID;
        transition_count[CORE_INT]++;
      }
      break;
    case CORE_FLOAT:
      if (NEXT_SYMBOL == 'E' || NEXT_SYMBOL == 'e') {
        state = CORE_S2;
        transition_count[CORE_FLOAT]++;
      } else if (!ee_isdigit(NEXT_SYMBOL)) {
        state = CORE_INVALID;
        transition_count[CORE_FLOAT]++;
      }
      break;
    case CORE_S2:
      if (NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-') {
        state = CORE_EXPONENT;
        transition_count[CORE_S2]++;
      } else {
        state = CORE_INVALID;
        transition_count[CORE_S2]++;
      }
      break;
    case CORE_EXPONENT:
      if (ee_isdigit(NEXT_SYMBOL)) {
        state = CORE_SCIENTIFIC;
        transition_count[CORE_EXPONENT]++;
      } else {
        state = CORE_INVALID;
        transition_count[CORE_EXPONENT]++;
      }
      break;
    case CORE_SCIENTIFIC:
      if (!ee_isdigit(NEXT_SYMBOL)) {
        state = CORE_INVALID;
        transition_count[CORE_INVALID]++;
      }
      break;
    default:
      break;
    }
  }
  *instr = str;
  return state;
}