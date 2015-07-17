# README #

Installs the Kolab Calendar plugin for Roundcube

## Installation ##
* chmod +x install_calendar_plugin.sh
* Run ./install_calendar_plugin.sh <path to roundcube>. Example:

`./install_calendar_plugin.sh /var/www/html/roundcube`

* Add calendar to the plugins array within config/config.inc.php to activate the plugin

`
$config['plugins'] = array(
    'archive',
    'zipdownload',
    'calendar',
);
`

### Who do I talk to? ###

* Ferhat Yildiz <ferhat.yildiz@turingts.com>
