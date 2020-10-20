<?php
$config = array();
$config['db'] = 'mysql';
$config['mysql.host'] = '{{cfg.mytinytodo.mysql.host}}';
$config['mysql.db'] = '{{cfg.mytinytodo.mysql.database}}';
$config['mysql.user'] = '{{cfg.mytinytodo.mysql.user}}';
$config['mysql.password'] = '{{cfg.mytinytodo.mysql.password}}';
$config['prefix'] = '{{cfg.mytinytodo.mysql.prefix}}';
$config['url'] = '{{cfg.mytinytodo.url}}';
$config['mtt_url'] = '{{cfg.mytinytodo.url}}';
$config['title'] = '{{cfg.mytinytodo.title}}';
$config['lang'] = 'en';
$config['password'] = '';
$config['smartsyntax'] = 1;
$config['timezone'] = 'Europe/Paris';
$config['autotag'] = 1;
$config['duedateformat'] = 1;
$config['firstdayofweek'] = 1;
$config['session'] = 'files';
$config['clock'] = 24;
$config['dateformat'] = 'j M Y';
$config['dateformat2'] = 'Y-m-d';
$config['dateformatshort'] = 'j M';
$config['template'] = 'default';
$config['showdate'] = 0;
$config['detectmobile'] = 1;
?>
