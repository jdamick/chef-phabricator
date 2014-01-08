# admin account
###############
default['phabricator']['create_admin'] = true
default['phabricator']['admin_username'] = 'admin'
default['phabricator']['admin_email'] = 'phabricator@localhost'
default['phabricator']['admin_password'] = 'letmein'

# nginx server_name
default['phabricator']['domain'] = 'phabricator.dev'

# user to own the checked out files
default['phabricator']['user'] = 'root'
# dir where phabricator and deps are installed
default['phabricator']['install_dir'] = '/opt'

# ngix service name, maybe different on platforms
default['phabricator']['nginx']['service'] = 'nginx'

# phabricator config saved into conf/local/local.json
# see ./bin/config list for available configuration
default['phabricator']['config'] = {
    'environment.append-paths' => ['/usr/bin', '/usr/local/bin'],
    # TODO: fix port
    'phabricator.base-uri' => 'http://phabricator.dev:4567',

    # mysql connection params
    'mysql.host' => 'localhost',
    'mysql.port' => 3306,
    'mysql.user' => value_for_platform_family(
        'pld' => 'mysql',
        'default' => 'root',
    ),
    'mysql.pass' => '',
}

# packages to install before proceeding, php, nginx, etc
# Platform specific packages
case node['platform_family']
when 'pld'
  default['phabricator']['packages'] = %w{git-core php-program php-spl php-mysql php-json php-filter php-hash php-openssl php-mbstring php-iconv php-curl php-fileinfo php-pecl-APC php-gd}
when 'debian'
  default['phabricator']['packages'] = %w{git dpkg-dev php5 php5-mysql php5-gd php5-dev php5-curl php-apc php5-cli php5-json}
else
  default['phabricator']['packages'] = %w{}
end
