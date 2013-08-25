name 'email'
description 'Email server'
run_list(
		'recipe[hostname]',
		'recipe[build-essential]',
		'recipe[openssl]',
		'recipe[x509]',
		'recipe[base]',
		'recipe[mariadb]',
		'recipe[iptables]',
		'recipe[apache]',
		'recipe[php]',
		'recipe[newrelic]',
		'recipe[mailserver]',
		'recipe[postfix]',
		'recipe[dovecot]',
		'recipe[opendkim]',
		'recipe[roundcube]',
)

default_attributes(
		:set_fqdn => '*.kroehling.de',
		:x509 => {
				:ca => 'kroehling.de',
				:country => 'DE',
				:state => 'Bayern',
				:city => 'Muenchen',
				:organization => 'kroehling.de',
				:email => 'ops@kroehling.de'
		},
		:build_essential => {
				:compiletime => true
		},
		:newrelic => {
				:server_monitoring => {
						:ssl => true
						# :license => 'REPLACE_WITH_YOUR_KEY' ## set it directly on chef server
				},
				:application_monitoring => {
						:ssl => true
						# :license => 'REPLACE_WITH_YOUR_KEY' ## set it directly on chef server
				}
		},
)
