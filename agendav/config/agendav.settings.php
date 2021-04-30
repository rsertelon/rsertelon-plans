<?php
/**
 * Site configuration
 *
 * IMPORTANT: These are AgenDAV defaults. Do not change this file, apply your
 * changes to settings.php
 */

// Site title
$app['site.title'] = '{{cfg.agendav.title}}';

// Site logo (should be placed in public/img). Optional
$app['site.logo'] = 'agendav_100transp.png';

// Site favicon (should be placed in public/img). Optional
$app['site.favicon'] = 'favicon.ico';

// Site footer. Optional
$app['site.footer'] = 'AgenDAV ' . \AgenDAV\Version::V;

// Trusted proxy ips
$app['proxies'] = [];

// Database settings
$app['db.options'] = [
        'dbname' => '{{cfg.agendav.database.name}}',
        'user' => '{{cfg.agendav.database.user}}',
        'password' => '{{cfg.agendav.database.password}}',
        'host' => '{{cfg.agendav.database.host}}',
        'port' => '{{cfg.agendav.database.port}}',
        'driver' => 'pdo_mysql'
];

// CSRF secret
$app['csrf.secret'] = '{{cfg.agendav.csrf_secret}}';

// Log path
$app['log.path'] = __DIR__.'/../var/log/';

// Logging level
$app['log.level'] = 'INFO';

// Base URL
$app['caldav.baseurl'] = '{{cfg.agendav.caldav.base_url}}';

// Authentication method required by CalDAV server (basic or digest)
$app['caldav.authmethod'] = 'basic';

// Whether to show public CalDAV urls
$app['caldav.publicurls'] = {{cfg.agendav.caldav.show_public_urls}};

// Whether to show public CalDAV urls
$app['caldav.baseurl.public'] = '{{cfg.agendav.caldav.public_base_url}}';

// Connection timeout for CalDAV requests (default: wait forever)
$app['caldav.connect.timeout'] = 0;
//
// Response timeout for CalDAV requests (default: wait forever)
$app['caldav.response.timeout'] = 0;

// Whether to verify the SSL certificate (default: true)
$app['caldav.certificate.verify'] = true;

// Email attribute name
$app['principal.email.attribute'] = '{DAV:}email';

// Calendar sharing
$app['calendar.sharing'] = false;

// Calendar sharing permissions. In case of doubt, do not modify them
// These defaults are only useful for DAViCal (http://wiki.davical.org/index.php/Permissions)
$app['calendar.sharing.permissions'] = [
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
];

// Default timezone
$app['defaults.timezone'] = '{{cfg.agendav.defaults.timezone}}';

// Default languajge
$app['defaults.language'] = '{{cfg.agendav.defaults.language}}';

// Default time format. Options: '12' / '24'
$app['defaults.time_format'] = '{{cfg.agendav.defaults.time_format}}';

/*
 * Default date format. Options:
 *
 * - ymd: YYYY-mm-dd
 * - dmy: dd-mm-YYYY
 * - mdy: mm-dd-YYYY
 */
$app['defaults.date_format'] = '{{cfg.agendav.defaults.date_format}}';

// Default first day of week. Options: 0 (Sunday), 1 (Monday)
$app['defaults.weekstart'] = {{cfg.agendav.defaults.weekstart}};

// Default for showing the week numbers. Options: true/false
$app['defaults.show_week_nb'] = {{cfg.agendav.defaults.show_week_nb}};

// Default for showing the "now" indicator, a line on current time. Options: true/false
$app['defaults.show_now_indicator'] = {{cfg.agendav.defaults.show_now_indicator}};
//
// Default number of days covered by the "list" (agenda) view. Allowed values: 7, 14 or 31
$app['defaults.list_days'] = {{cfg.agendav.defaults.list_days}};

// Default view (month, week, day or list)
$app['defaults.default_view'] = '{{cfg.agendav.defaults.default_view}}';

// Logout redirection. Optional
$app['logout.redirection'] = '';

// Calendar colors
$app['calendar.colors'] = [
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
];

// Additionnal authentication methods
//$app['auth.methods'] = ['AgenDAV\Authentication\HttpBasic'];