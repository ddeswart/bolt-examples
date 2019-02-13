plan profiles::nginx_install(
     TargetSpec $nodes,
     String $site_content = 'hello!',
   ) {

     # Install the puppet-agent package if Puppet is not detected.
     # Copy over custom facts from the Bolt modulepath.
     # Run the `facter` command line tool to gather node information.
     $nodes.apply_prep

     # Compile the manifest block into a catalog
     apply($nodes) {
       if($facts['os']['family'] == 'redhat') {
         package { 'epel-release':
           ensure => present,
           before => Package['nginx'],
         }
         $html_dir = '/usr/share/nginx/html'
       } else {
         $html_dir = '/var/www/html'
       }

       # install nginx
       package {'nginx':
         ensure => present,
       }

       # deploy website
       file { '/root/Boltdir/site/profiles/files/sample_website':
       ensure  => directory,
       owner   => 'root',
       group   => 'root',
       mode    => '0755',
       path    => $html_dir,
       source  => "file:/root/Boltdir/site/profiles/files/sample_website",
       recurse => true,
       }

       file {"${html_dir}/index.html":
         content => epp('profiles/index.html.epp'),
         ensure  => file,
       }

       # start nginx
       service {'nginx':
         ensure  => 'running',
         enable  => 'true',
         require => Package['nginx']
       }

       # open http - port 80
       include firewalld

       firewalld_port { 'Open port for web':
       ensure   => present,
       zone     => 'public',
       port     => '80',
       protocol => 'tcp',
       }

     }
   }
