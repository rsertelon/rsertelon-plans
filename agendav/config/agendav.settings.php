<?php
/**
 * Site configuration
 *
 * IMPORTANT: These are AgenDAV defaults. Do not change this file, apply your
 * changes to settings.php
 */

return [
    // Site title
    'site.title' => '{{cfg.agendav.title}}',

    // Site logo (should be placed in public/img). Optional
    'site.logo' => 'agendav_100transp.png',

    // Site favicon (should be placed in public/img). Optional
    'site.favicon' => 'favicon.ico',

    // Site footer. Optional
    'site.footer' => 'AgenDAV ' . \AgenDAV\Version::V,

    // Base path when AgenDAV is served from a subdirectory (e.g. '/agendav').
    // Empty string means it is served at the root of the domain. Used to set
    // Slim's base path (routing + url_for) and to prefix generated asset URLs.
    'app.base_path' => '',

    // Trusted proxy ips
    'proxies' => [],

    // Database settings
    'db.options' => [
        'dbname' => '{{cfg.agendav.database.name}}',
        'user' => '{{cfg.agendav.database.user}}',
        'password' => '{{cfg.agendav.database.password}}',
        'host' => '{{cfg.agendav.database.host}}',
        'port' => '{{cfg.agendav.database.port}}',
        'driver' => 'pdo_mysql'
    ],

    // CSRF secret
    'csrf.secret' => '{{cfg.agendav.csrf_secret}}',

    // Log path
    'log.path' => '{{pkg.svc_var_path}}/log/',

    // Logging level
    'log.level' => 'INFO',

    // Base URL
    'caldav.baseurl' => '{{cfg.agendav.caldav.base_url}}',

    // Authentication method required by CalDAV server (basic or digest)
    'caldav.authmethod' => 'basic',

    // Whether to show public CalDAV urls
    'caldav.publicurls' => {{cfg.agendav.caldav.show_public_urls}},

    // Public CalDAV URL shown to users
    'caldav.baseurl.public' => '{{cfg.agendav.caldav.public_base_url}}',

    // Connection timeout for CalDAV requests (default: wait forever)
    'caldav.connect.timeout' => 0,
    //
    // Response timeout for CalDAV requests (default: wait forever)
    'caldav.response.timeout' => 0,

    // Whether to verify the SSL certificate (default: true)
    'caldav.certificate.verify' => true,

    // Email attribute name
    'principal.email.attribute' => '{DAV:}email',

    // Calendar sharing
    'calendar.sharing' => false,

    // Calendar sharing permissions. In case of doubt, do not modify them
    // These defaults are only useful for DAViCal (http://wiki.davical.org/index.php/Permissions)
    'calendar.sharing.permissions' => [
        'owner' => [
            '{DAV:}all',
            '{DAV:}read',
            '{DAV:}unlock',
            '{DAV:}read-acl',
            '{DAV:}read-current-user-privilege-set',
            '{DAV:}write-acl',
            '{urn:ietf:params:xml:ns:caldav}read-free-busy',
            '{DAV:}write',
            '{DAV:}write-properties',
            '{DAV:}write-content',
            '{DAV:}bind',
            '{DAV:}unbind'
        ],
        'read-only' => [ '{DAV:}read', '{urn:ietf:params:xml:ns:caldav}read-free-busy'],
        'read-write' => [ '{DAV:}read', '{DAV:}write', '{urn:ietf:params:xml:ns:caldav}read-free-busy' ],
        'default' => [ '{urn:ietf:params:xml:ns:caldav}read-free-busy' ]
    ],

    // Default timezone
    'defaults.timezone' => '{{cfg.agendav.defaults.timezone}}',

    // Default languajge
    'defaults.language' => '{{cfg.agendav.defaults.language}}',

    // Default time format. Options: '12' / '24'
    'defaults.time_format' => '{{cfg.agendav.defaults.time_format}}',

    /*
    * Default date format. Options:
    *
    * - ymd: YYYY-mm-dd
    * - dmy: dd-mm-YYYY
    * - mdy: mm-dd-YYYY
    */
    'defaults.date_format' => '{{cfg.agendav.defaults.date_format}}',

    // Default first day of week. Options: 0 (Sunday), 1 (Monday)
    'defaults.weekstart' => {{cfg.agendav.defaults.weekstart}},

    // Default for showing the week numbers. Options: true/false
    'defaults.show_week_nb' => {{cfg.agendav.defaults.show_week_nb}},

    // Default for showing the "now" indicator, a line on current time. Options: true/false
    'defaults.show_now_indicator' => {{cfg.agendav.defaults.show_now_indicator}},

    // Default number of days covered by the "list" (agenda) view. Allowed values: 7, 14 or 31
    'defaults.list_days' => {{cfg.agendav.defaults.list_days}},

    // Default view (month, week, day or list)
    'defaults.default_view' => '{{cfg.agendav.defaults.default_view}}',

    // Logout redirection. Optional
    'logout.redirection' => '',

    // Calendar colors
    'calendar.colors' => [
        '03A9F4', // Light blue
        '3F51B5', // Indigo
        'F44336', // Red
        'E91E63', // Pink
        '9C27B0', // Purple
        '673AB7', // Deep purple

        'B3E5FC', // Pale light blue
        'C5CAE9', // Pale Indigo
        'FFCDD2', // Pale red
        'F8BBD0', // Pale pink
        'E1BEE7', // Pale purple
        'D1C4E9', // Pale deep purple

        '4CAF50', // Green
        'FFC107', // Yellow
        'CDDC39', // Lime
        'FF9800', // Orange
        '795548', // Brown
        '9E9E9E', // Gray

        'C8E6C9', // Pale green
        'FFF9C4', // Pale yellow
        'F0F4C3', // Pale lime
        'FFE0B2', // Pale orange
        'D7CCC8', // Pale brown
        'F5F5F5', // Pale gray
    ],

    // Additional authentication methods (FQCNs implementing AuthenticationMethodInterface)
    'auth.methods' => [],

    // HTTP debug logging
    'http.debug' => false,

    // Session storage backend. 'pdo' uses the database (default), 'native' uses
    // PHP file sessions (useful on hosts where MariaDB GET_LOCK() is unavailable).
    'session.handler' => 'pdo',

    // Doctrine ORM metadata/query cache driver. 'filesystem' (default) writes to
    // var/cache/. Set to 'redis' when a Redis server is reachable at orm.cache.redis.dsn.
    'orm.cache' => 'filesystem',

    // Redis DSN used when orm.cache = 'redis'. Example: 'redis://localhost:6379'
    'orm.cache.redis.dsn' => 'redis://localhost:6379',
];
