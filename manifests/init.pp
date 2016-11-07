class avst_tools_installations(
    $tarballs_to_install = {},
    $packages_to_install = {},
){
    create_resources('avst_tools_installations::avst_tarball_to_install', $tarballs_to_install)
    create_resources('avst_tools_installations::avst_package_to_install', $packages_to_install)
}