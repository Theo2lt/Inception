<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'BDD_NAME' );

/** Database username */
define( 'DB_USER', 'BDD_USER' );

/** Database password */
define( 'DB_PASSWORD', 'BDD_PASSWORD');

/** Database hostname */
define( 'DB_HOST', 'BDD_HOST' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'XmqvZCu7vf#v>CQu@8z(PbxUh;&B.so%,p%8DGs4T)Vk})sTEXJ>u&g~uzjmQLj*' );
define( 'SECURE_AUTH_KEY',  '5qFIP5EmE^AXinWl [78~RhRBlBB+ulu}y&xkRFj))T?zhPTP`Darlf5$dBh)qfd' );
define( 'LOGGED_IN_KEY',    '/Zu~*7%4?+`pwT^;(i9,mF2j? _ev/lkfR<t5gUn</vufv}UCvNdCU3U<:E38!;f' );
define( 'NONCE_KEY',        'fXM]M#o5b_Mt}U n$#gv<0b{T<+<1#tSgfmJ{58!].v4&aa?t>k`)o5I4aS#ptb-' );
define( 'AUTH_SALT',        'upnC Ba&[X5MU];V614Hz*V3=e:+XDI>Sf7e[${O=7zB Wk,J`Q#}}Ba3b: zJ`K' );
define( 'SECURE_AUTH_SALT', ' %KR*Vb^yD*v9p9b@SY?:sw^^1X4 :DPxUD;4kzti5{dC,Mbi(k~(by>IZ}=^,%.' );
define( 'LOGGED_IN_SALT',   '[%z*x0aa`@DBC8`>eIt+*u<{b@wuAhF;4LH$ex<y{%7h1Jd0S?[@}D@.|D)KyqV:' );
define( 'NONCE_SALT',       'DzM6N*p;9cf0H_E0}l+^750[vc{iKUxihr7wvtoT9XZ}*[5IXqy<|vsUQKd7(*H;' );

/**#@-*/

/**
 * WordPress database table prefix.
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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';