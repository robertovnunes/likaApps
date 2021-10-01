<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'sitelika');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'ksw2@01Sxw1S');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '+A_Wfj*bX<lz;=G|H7Hae=|Zf5Ejw7L/W:8dXIA@p;pXr3fS7wg{-T,w!WmDGmR(');
define('SECURE_AUTH_KEY',  '<2`:AKmp[|p<ujd~`c-AZ5CJB+xt88Tl:2i2x)+l=s45!DO14x@V{aL :=>1D3>H');
define('LOGGED_IN_KEY',    'zv(mt]f|80xeAtB//QmL:Ze/fBs(1F9v&g4h/B]q|i|92Mbo-|j7rc.@XP>+{Uuv');
define('NONCE_KEY',        '2%6@N_L<q&;X{4S;/5ytJhu*ccikX^eo+^]r) }.53o(f6!]g>JA#)_g}xbK3%Gz');
define('AUTH_SALT',        '71+a)^ix~)T+8w+<d&8q2,]m2Pdru/3=@y6~/qTa@&tFN|8iAPSuvpcYb3? oNGO');
define('SECURE_AUTH_SALT', 'Z{Z$3bxlKod4c+g~2{Dd0U+OcnF(Q^}uknDaGZ^Z~/xeDSk]6?><dXs-CN+Rs|rm');
define('LOGGED_IN_SALT',   'A#NXbmS`3=~AR!_1TjeW-w,6^6:7$fgFH,dGw(6:rd9kd[pNZ@G7*_!h+ZK~/2#{');
define('NONCE_SALT',       '3S/t}|l?{+m-SksauZQO.6&X++!,[)5L=>CfA:rlFkzEt-k<Ck[@(kP(z5F]h?Ts');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
