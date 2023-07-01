<?php

define('DB_NAME', 'db_name');
define('DB_USER', 'db_user');
define('DB_PASSWORD', 'db_pwd');
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

$table_prefix = 'wp';

define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);
define('WP_MEMORY_LIMIT', '256M');
define('WP_MAX_MEMORY_LIMIT', '512M');

define( 'AUTH_KEY',         'L},oSl6W>5rF|S^n8_0U#1qdjH :|X/ftA[>V)+.8-(|LUY~?mO.{YN4@k//<qF.' );
define( 'SECURE_AUTH_KEY',  '?v[[ypnjm&Kd Eh|;Gn/k,*JG[sgWyz}?E $z)8xcC>9DEjO-yFW&GluoYau5{cJ' );
define( 'LOGGED_IN_KEY',    'kGm?80;a))&g WL0theO?.{n?MA<bfgkV7cR`W{K;KiD^0o*LDGC#}c ZQ2Y9e<$' );
define( 'NONCE_KEY',        '>a(vr61bac}b,kqvO6w3@_L/0m2~;`p@J{&FS[a$D]RABDH6DJ]/t~VtDa_t0`2G' );
define( 'AUTH_SALT',        'SC=UQ2!_!=}4]e9*!ULcH|(>C4=/1o]7/o[+/Sxkja>uD!]u@wYO6b *q<UzZ=<r' );
define( 'SECURE_AUTH_SALT', 'uZKPU^(/[oemLLm~OK;.7q5$28RDsh427+}u/K|/G }h`>.cH(K<^CS{?AlD<^k_' );
define( 'LOGGED_IN_SALT',   '*_jsLYX~GrODN9uK:(2<ZVs*Y1Jb%[bcZ?Zst: _r%whN**R;:8D~RJ(;+dz,wJ_' );
define( 'NONCE_SALT',       'ON613WEww3IfULD11ln4SYN%a_[QYF5YkdH%HM520X``.{w;3z]lN:U=b=.eZ9>]' );

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once ABSPATH . 'wp-settings.php';