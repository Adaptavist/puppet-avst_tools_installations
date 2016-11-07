define avst_tools_installations::avst_tarball_to_install (
  $download_url,
  $download_command     = 'curl -O -J -L',
  $download_location    = '/tmp',
  $extract_command      = 'tar -zxvf',
  $extract_location     = '/usr/share',
  $create_script        = 'false',
  $script_path          = '/usr/bin/avst_jvmtop.sh',
  $script_template_path = 'avst_tools_installations/avst_jvmtop.erb',
  $script_user          = 'root',
  $script_group         = 'root',
  $script_mask          = '0755',
) {
  $download_url_splitted = split($download_url, '/')
  $tarball_file_name = $download_url_splitted[-1]

  exec {
      "download_${name}_tarball":
          command   => "cd ${download_location} && ${download_command} ${download_url}",
          logoutput => on_failure,
  } ->
  exec {
      "extract_${name}_tarball":
          command   => "${extract_command} ${download_location}/${tarball_file_name} -C ${extract_location}",
          logoutput => on_failure,
          onlyif    => ["test -f ${download_location}/${tarball_file_name}"],
  }

  if (str2bool($create_script)){
    file { $script_path:
            ensure  => file,
            content => template($script_template_path),
            owner   => $script_user,
            group   => $script_group,
            mode    => $script_mask,
            require => Exec["extract_${name}_tarball"],
    }
  }

}
