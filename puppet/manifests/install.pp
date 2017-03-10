#===========================================================
# make sure that this puppet script is run as sudo
if $id != "root" {
  fail("ERROR: you need to run this puppet script as 'root'. Use 'sudo' tool...")
} 
notice("SUCCESS: You runned tool as root")

#===========================================================
# global puppet commands configurations 
Exec { 
   path      => $path,
   logoutput => on_failure,
} 

class system_packages_install {
    notice ("Installing system repository packages...")
    $packages = [
      "vim",
    ]

    exec { 'update_apt_get': 
        command => "apt-get update",
        user    => root,
    }

    package { $packages: 
      ensure  => installed, 
      require => Exec["update_apt_get"],
    }

}
include system_packages_install

