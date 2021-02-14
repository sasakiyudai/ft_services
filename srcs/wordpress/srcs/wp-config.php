<?php

define('WP_CONTENT_DIR', '/var/www/wp-content');
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'syudai' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'j LC~WyQr6SU@|>n8.Vrqv|jc]1T-]BMTc.I8-`JheT98wK+u{5VoO&74nJSOs%9');
define('SECURE_AUTH_KEY',  'Ja~VU#=<zqfeWK4gkK4kTsUl;Iq2+)%X2)J~RiN%BwGxEkH6S!|=254*|<y=@vH5');
define('LOGGED_IN_KEY',    'NrT2Bu4c1J^B[]H1{{GucD|V7+[l~+E#jvN}rP+0Z57F)/s ;GOG)E,uf*3`)ACs');
define('NONCE_KEY',        'u+U=63-_QpnIU=!U@ 2%IJ5pL&qAW{5U/[lmP?z%`(h-tC9~^jII(H=B7B.KfT%{');
define('AUTH_SALT',        'VA6UU3#P?1)u+xn.j~+9k-R=w4h)>N/ {PQDv)7O-g$Gi*n){/:P~S X+t+5eH&N');
define('SECURE_AUTH_SALT', 'lCDqfC+NXvcXm<Dn-aI]rn<A1f:m+-sdm93ckzPm%_an/H1{,p,D1;P IB.<Q-21');
define('LOGGED_IN_SALT',   'R.jU9*PNA;]ED~%>=J79y-^G(~[GRKP<!+fryOg)+>InNhm1XG@{;XHXF9Exw+)?');
define('NONCE_SALT',       '9$d/LkCPL_T5&A%pC=C5El<5cDn4Lvk3:~PwVg>R`HS$0l;`#idx=X7e&:0,)aZd');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
