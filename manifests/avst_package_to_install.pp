define avst_tools_installations::avst_package_to_install(
    $package_name,
    $package_ensure       = 'installed',
    $create_script        = 'false',
    $script_path          = '',
    $script_template_path = '',
    $script_user          = 'root',
    $script_group         = 'root',
    $script_mask          = '755',
) {
    
    if (!defined(Package[$package_name])) {
        package { $package_name:
              ensure => $package_ensure,
        }
    }

    if (str2bool($create_script)){
        file { $script_path:
                ensure  => file,
                content => template($script_template_path),
                owner   => $script_user,
                group   => $script_group,
                mode    => $script_mask,
            }
    }
}