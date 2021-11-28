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
  rgblight_mode_noeeprom(RGBLIGHT_MODE_RAINBOW_SWIRL);
}
#endif

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
/* Layer 0: Base layer (Default layer)
 * ,-----------------------------------------------------------------------------------------------.
 * | `   |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  0  |  -  |  =  | <=  | =>  | Home|
 * |-----------------------------------------------------------------------------------------------+
 * |   Tab   |  Q  |  W  |  E  |  R  |  T  |  Y  |  U  |  I  |  O  |  P  |  [  |  ]  |   \|  | PgUp|
 * |-----------------------------------------------------------------------------------------------+
 * |   CpLck   |  A  |  S  |  D  |  F  |  G  |  H  |  J  |  K  |  L  |  ;  |  '  |    Enter  | PgDn|
 * |-----------------------------------------------------------------------------------------------+
 * |   Shift   |  Z  |  X  |  C  |  V  |  B  |  N  |  M  |  ,  |  .  |  /  | Backspace | Up  | End |
 * |-----------------------------------------------------------------------------------------------+
 * | LCtrl |LGUI | LAlt  |               Space                   | Bash   |  FN  | Left| Dn  |Right|
 * `-----------------------------------------------------------------------------------------------'
 */
	[_BL] = LAYOUT(
    KC_GRV,		KC_1,	KC_2,	KC_3,	KC_4,	KC_5,	KC_6,	KC_7,	KC_8,	KC_9,	KC_0,	KC_MINS,	KC_EQL,	DESLEFT,	DESRIGHT,	KC_HOME,
    KC_TAB,		KC_Q,	KC_W,	KC_E,	KC_R,	KC_T,	KC_Y,	KC_U,	KC_I,	KC_O,	KC_P,	KC_LBRC,	KC_RBRC,	KC_BSLS, 					KC_PGUP,
    KC_CAPS,	KC_A,	KC_S,	KC_D,	KC_F,	KC_G,	KC_H,	KC_J,	KC_K,	KC_L,	KC_SCLN,	KC_QUOT,		KC_NO,	KC_ENT,				KC_PGDN,
    KC_LSFT,	KC_NO,KC_Z,	KC_X,	KC_C,	KC_V,	KC_B,	KC_N,	KC_M,	KC_COMM, KC_DOT,	KC_SLSH,		KC_BSPC,  KC_UP,		KC_END,
    KC_LCTL,KC_LGUI,KC_LALT,		KC_NO,			KC_SPC,			KC_NO,				 BASH,KC_NO, MO(_FL),	KC_LEFT,	KC_DOWN,	KC_RGHT
	),
/* Layer 1: FN Layer
 * ,-----------------------------------------------------------------------------------------------.
 * | Esc | F1  | F2  | F3  | F4  | F5  | F6  | F7  | F8  | F9  | F10 | F11 | F12 |     |     |DSCHM|
 * |-----------------------------------------------------------------------------------------------+
 * |         |  <- | Up  |  -> |     |     |     |     |     |     |BTWDN|     |     |       |DscUp|
 * |-----------------------------------------------------------------------------------------------+
 * |   CpLck   | Left| Down|Right|     |     |     |     |     |     |     |     |           |DscDn|
 * |-----------------------------------------------------------------------------------------------+
 * |           | Prev| Play| Stop| Next|     |     |     |      |    |     |    Del    |     | Msgr|
 * |-----------------------------------------------------------------------------------------------+
 * |      |     |       |                                       | TkMg   |       |     |     |     |
 * `-----------------------------------------------------------------------------------------------'
 */
	[_FL] = LAYOUT(
    KC_GESC,	KC_F1,		KC_F2,	KC_F3,	KC_F4,	KC_F5,	KC_F6,	KC_F7,	KC_F8,	KC_F9,	KC_F10,	KC_F11,	KC_F12,	_______,	_______,	DSCDHOME,
    _______,	BACK,   	KC_UP,	FORWARD,  _______, _______, _______, _______,  _______, _______, 	BTWRDN,   _______, _______, _______, DSCDUP,
    _______,	KC_LEFT,	KC_DOWN, KC_RIGHT,  _______, _______, _______, _______, _______, _______,	_______, _______, _______,	_______, DSCDDWN,
    _______,	_______,	KC_MPRV, KC_MPLY,  KC_MSTP,  KC_MNXT, _______, _______, _______, _______, _______, _______,  KC_DEL,  _______,	MSGR,
    _______,_______,_______,	_______,			_______,		_______,			TSKMGR,_______,_______,	_______,	_______,	_______
	),
};
