#include QMK_KEYBOARD_H

#define _BL 0
#define _NL 1
#define _FL 2
#define _FnL 3

#define DESLEFT LCTL(LGUI(KC_LEFT))
#define DESRIGHT LCTL(LGUI(KC_RIGHT))
#define BASH LCTL(LALT(KC_B))
#define BTWRDN LCTL(LALT(KC_0))
#define TSKMGR LCTL(LSFT(KC_ESC))
#define MSGR LCTL(LALT(KC_M))
#define FORWARD LALT(KC_RIGHT)
#define BACK LALT(KC_LEFT)
#define DSCDUP LALT(LSFT(KC_UP))
#define DSCDDWN LALT(LSFT(KC_DOWN))
#define DSCDHOME LCTL(LALT(KC_RIGHT))

#ifdef RGBLIGHT_ENABLE
void keyboard_post_init_user(void) {
  rgblight_enable_noeeprom(); // Enables RGB, without saving settings
  rgblight_sethsv_noeeprom(HSV_PURPLE);
  rgblight_mode_noeeprom(RGBLIGHT_MODE_BREATHING);
}
#endif

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
/* Layer 0: Base layer (Default layer)
 * ,-------------------------------------------------------------------------------.
 * | `   |  Q  |  W  |  E  |  R  |  T  |  Y  |  U  |  I  |  O  |  P  |  [  |   \|  |
 * |-------------------------------------------------------------------------------+
 * |  Tab  |  A  |  S  |  D  |  F  |  G  |  H  |  J  |  K  |  L  |  '  |    Enter  |
 * |-------------------------------------------------------------------------------+
 * | Shift  |  Z  |  X  |  C  |  V  |  B  |  N  |  M  |  ,  |  .  |  /  |   BKSPC  |
 * |-------------------------------------------------------------------------------+
 *       | LCtrl |LGUI| LAlt |   Space   |       FN1       | FN2 | FN3 |
 *       `-------------------------------------------------------------'
 */
  [_BL] = LAYOUT_all(
    KC_GRV,   KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I,    KC_O,   KC_P,    KC_LBRC, KC_BSLS,
    KC_TAB,   KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K,    KC_L,   KC_QUOT, KC_ENT,
    KC_LSFT,  KC_Z, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_BSPC,
    KC_LCTL,  KC_LGUI,   KC_LALT,     KC_SPC,    MO(1),        MO(1),  MO(2),   MO(3)
    ),
/* Layer 1: Number layer
 * ,-------------------------------------------------------------------------------.
 * |     |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  0  |  -  |   =   |
 * |-------------------------------------------------------------------------------+
 * |       |     |     |     |     |     |     |     |     |  ]  |  ;  |           |
 * |-------------------------------------------------------------------------------+
 * |        |     |     |     |     |     |     |     |     |     |     |          |
 * |-------------------------------------------------------------------------------+
 *       |       |    |      |           |                 |     |     |
 *       `-------------------------------------------------------------'
 */
  [_NL] = LAYOUT_all(
    _______,  KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8,     KC_9,    KC_0,    KC_MINS, KC_EQL,
    _______,  _______, _______, _______, _______, _______, _______, _______, _______,  KC_RBRC, KC_SCLN, _______,
    _______,  _______, _______, _______, _______, _______, _______, _______, _______,  _______,  _______, _______,
    _______,  _______,   _______,     _______,    _______,        _______,  _______,   _______
    ),
/* Layer 2: F layer
 * ,-------------------------------------------------------------------------------.
 * | ESC |  F1 | F2  | F3  | F4  | F5  | F6  | F7  | F8  | F9  | F10 | F11 |  F12  |
 * |-------------------------------------------------------------------------------+
 * |       |     |     |     |     |     |     |     |     |     |     |           |
 * |-------------------------------------------------------------------------------+
 * |        |     |     |     |     |     |     |     |     |     |     |          |
 * |-------------------------------------------------------------------------------+
 *       |       |TkMg|      |           |                 |     |     |
 *       `-------------------------------------------------------------'
 */
  [_FL] = LAYOUT_all(
    KC_GESC,  KC_F1,  KC_F2,  KC_F3,  KC_F4,  KC_F5,  KC_F6,  KC_F7,  KC_F8,    KC_F9,  KC_F10,   KC_F11,  KC_F12,
    _______,  _______, _______, _______, _______, _______, _______, _______, _______,  KC_RBRC, KC_SCLN, _______,
    _______,  _______, _______, _______, _______, _______, _______, _______, _______,  _______,  _______, _______,
    _______,  TSKMGR,   _______,     _______,    _______,        _______,  _______,   _______
    ),
/* Layer 3: FN layer
 * ,-------------------------------------------------------------------------------.
 * | <=  | <-  | Up  | ->  |     |     |     |DscUp| PgUp|DscDn|BTWDN|  ]  |  =>   |
 * |-------------------------------------------------------------------------------+
 * |       | Left| Down|Right|     |     |     | Home| PgDn| End |DSCHM|           |
 * |-------------------------------------------------------------------------------+
 * |        | Prev| Play| Stop| Next|     |     | Msgr|     |     |     |   Del    |
 * |-------------------------------------------------------------------------------+
 *       |       |Bash|      |           |                 |     |     |
 *       `-------------------------------------------------------------'
 */
  [_FnL] = LAYOUT_all(
    DESLEFT,  BACK, KC_UP, FORWARD, _______, _______, _______, DSCDUP, KC_PGUP, DSCDDWN, BTWRDN, KC_LBRC,DESRIGHT,
    _______,   KC_LEFT,  KC_DOWN,  KC_RGHT, _______, _______, _______, KC_HOME, KC_PGDN, KC_END,  DSCDHOME, _______,
    _______,  KC_MPRV,  KC_MPLY,  KC_MSTP, KC_MNXT, _______, _______, MSGR,     _______, _______, _______,  KC_DEL,
    _______,  BASH,   _______,     _______,    _______,        _______,  _______,   _______
    ),
};

uint32_t layer_state_set_kb(uint32_t state) {
  // if we are on layer 1
  if (state & (1<<1)){
    // light num lock led
    PORTD |= (1 << PD0);
  }
  else{
    PORTD &= ~(1 << PD0);
  }
  // if we are on layer 2
  if (state & (1<<2)){
    // light caps lock led
    PORTD |= (1 << PD1);
  }
  else{
    PORTD &= ~(1 << PD1);
  }
  // if we are on layer 3
  if (state & (1<<3)){
    // light scroll lock led
    PORTD |= (1 << PD6);
  }
  else{
    PORTD &= ~(1 << PD6);
  }
    return state;
}