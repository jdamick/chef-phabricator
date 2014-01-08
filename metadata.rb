name             'phabricator'
#maintainer       'Jelmer Snoeck'
#maintainer_email 'jelmer.snoeck@gmail.com'
maintainer       'Jeffrey Damick'
maintainer_email 'TBD'
license          'BSD'
description      'Chef cookbook to install Phabricator'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

%w(nginx).each { |cb| depends cb }
