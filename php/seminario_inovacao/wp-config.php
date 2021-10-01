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
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', 'CKUADWNRHjdE54Wm');

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
define('AUTH_KEY',         'zMj<e7.O4C*YAfQFGsG[bD9xKQ[t]xc`+@51tDzK^tS|bv/C;JYH>]J%k7vO7b)T');
define('SECURE_AUTH_KEY',  '{XEOaQc|4JxMn|=n 0W+OaZQF9g=}`V{/J#0,NBD%uKG;i&$ef@04lJ@gII^aNI9');
define('LOGGED_IN_KEY',    '^qv[+hiIzkkM-%>=beUq%4z1DA,5A_-CWM-$amBz}tdS8MS@ec324#gGl}$peyD1');
define('NONCE_KEY',        '](%{wBH+)E5xz.qoiCg6!,sg+L/O:.a9c:IY+]B(MVgEFsn*?3C``N}8)m;EjYk[');
define('AUTH_SALT',        '?S)>[n|Wr=MsIkY4U;z|Vm%)nm>m4a,KB@t#aV0#wzzBBgW&NUw/l{pQf#b}2n.)');
define('SECURE_AUTH_SALT', '<2duJ%W W8L4eoZ=pvnM<>OzORr:L3hQds;uuLvs7heiIXP( j#zHc#u-<QH4<AS');
define('LOGGED_IN_SALT',   '5Udx~->dk|nlTT|hm=GATL+(tz^`#5a*+KMTBAo2pL(lU1Xg|a?l&O@!2nt9Dmve');
define('NONCE_SALT',       '{lo+[|T>;l-x_qcig kcoT,j)V:2+a^}-l+HO:|fQv+&!+_6]5+3sLBVZCfY2|>@');

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
