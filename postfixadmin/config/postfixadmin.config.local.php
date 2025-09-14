<?php
$CONF['configured'] = true;
$CONF['version'] = '{{pkg.version}}';

$CONF['setup_password'] = '{{cfg.postfixadmin.setup_password}}';

// Language config
$CONF['default_language'] = '{{cfg.postfixadmin.default_language}}';

// Database Config
$CONF['database_type'] = '{{cfg.postfixadmin.database.type}}';
$CONF['database_host'] = '{{cfg.postfixadmin.database.host}}';
$CONF['database_user'] = '{{cfg.postfixadmin.database.user}}';
$CONF['database_password'] = '{{cfg.postfixadmin.database.password}}';
$CONF['database_name'] = '{{cfg.postfixadmin.database.name}}';

// Site Admin
$CONF['admin_email'] = '{{cfg.postfixadmin.admin.email}}';

// Site admin name
$CONF['admin_name'] = '{{cfg.postfixadmin.admin.name}}';

// Mail Server
$CONF['smtp_server'] = '{{cfg.postfixadmin.smtp.server}}';
$CONF['smtp_port'] = '{{cfg.postfixadmin.smtp.port}}';

// Default Aliases
$CONF['default_aliases'] = array (
    'abuse' => '{{cfg.postfixadmin.default_aliases.abuse}}',
    'hostmaster' => '{{cfg.postfixadmin.default_aliases.hostmaster}}',
    'postmaster' => '{{cfg.postfixadmin.default_aliases.postmaster}}',
    'webmaster' => '{{cfg.postfixadmin.default_aliases.webmaster}}'
);

// Footer
$CONF['footer_link'] = '{{cfg.postfixadmin.homepage_url}}';
