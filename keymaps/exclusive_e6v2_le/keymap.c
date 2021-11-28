#include QMK_KEYBOARD_H

#define _BL 0
#define _FL 1

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
  rgblight_sethsv_noeeprom(HSV_GOLD);
  rgblight_mode_noeeprom(RGBLIGHT_MODE_BREATHING);
}
#endif

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
/* Layer 0: Base layer (Default layer)
 * ,-----------------------------------------------------------------------------------------.
 * | `   |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  0  |  -  |  =  | <=  | =>  |
 * |-----------------------------------------------------------------------------------------+
 * |   Tab   |  Q  |  W  |  E  |  R  |  T  |  Y  |  U  |  I  |  O  |  P  |  [  |  ]  |   \|  |
 * |-----------------------------------------------------------------------------------------+
 * |   Ctrl    |  A  |  S  |  D  |  F  |  G  |  H  |  J  |  K  |  L  |  ;  |  '  |    Enter  |
 * |-----------------------------------------------------------------------------------------+
 * | Shift     |  Z  |  X  |  C  |  V  |  B  |  N  |  M  |  ,  |  .  |  /  | Backspace | FN  |
 * |-----------------------------------------------------------------------------------------+
 *           |LGUI | LAlt  |               Space                   | Bash   |TkMg |
 *           `--------------------------------------------------------------------'
 */
  [_BL] = LAYOUT_60_hhkb(
    KC_GRV,  KC_1,  KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8,    KC_9,   KC_0,    KC_MINS, KC_EQL,  DESLEFT, DESRIGHT,
    KC_TAB,  KC_Q,  KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I,    KC_O,   KC_P,    KC_LBRC, KC_RBRC, KC_BSLS,
    KC_LCTL, KC_A,  KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K,    KC_L,   KC_SCLN, KC_QUOT, KC_ENT,
    KC_LSFT, KC_Z,  KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_BSPC, MO(_FL),
             KC_LGUI, KC_LALT,                         KC_SPC,                           BASH, TSKMGR
    ),

/* Layer 1: FN Layer
 * ,-----------------------------------------------------------------------------------------.
 * | Esc | F1  | F2  | F3  | F4  | F5  | F6  | F7  | F8  | F9  | F10 | F11 | F12 |     |     |
 * |-----------------------------------------------------------------------------------------+
 * |         |  <- | Up  |  -> |     |     |     |DscUp| PgUp|DscDn|BTWDN|     |     |       |
 * |-----------------------------------------------------------------------------------------+
 * |   CpLck   | Left| Down|Right|     |     |     | Home| PgDn| End|DSCHM|     |            |
 * |-----------------------------------------------------------------------------------------+
 * |           | Prev| Play| Stop| Next|     |     | Msgr|      |    |     |    Del    |     |
 * |-----------------------------------------------------------------------------------------+
 *           |       |       |                                    |       |       |
 *           `--------------------------------------------------------------------'
 */
  [_FL] = LAYOUT_60_hhkb(
    KC_ESC, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, _______, _______,
    _______, BACK, KC_UP, FORWARD, _______, _______, _______, DSCDUP, KC_PGUP, DSCDDWN, BTWRDN, _______, _______, _______,
    KC_CAPS, KC_LEFT, KC_DOWN, KC_RIGHT, _______, _______, _______, KC_HOME, KC_PGDN, KC_END,  DSCDHOME, _______, _______,
    _______, KC_MPRV, KC_MPLY,  KC_MSTP,  KC_MNXT, _______, _______, MSGR,   _______, _______, _______,  KC_DEL,  _______,
             _______, _______,                        _______,                        _______, _______
    ),
};