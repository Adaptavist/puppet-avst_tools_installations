require 'spec_helper'
 
tarballs = { 
        'jvmtop' => {
          'download_url' => 'download_url',
          'create_script' => 'false' 
          }
        }
packages = { 
        'jvmtop' => {
          'package_ensure' => 'latest',
          'package_name' => 'package'
          }
        }

describe 'avst_tools_installations', :type => 'class' do
  
  context "Should create resources passed as tarballs to install" do
    let(:params){{
      :tarballs_to_install => tarballs
    }}
    it do
      should contain_avst_tools_installations__avst_tarball_to_install('jvmtop').with(
        'download_url' => 'download_url'
        )
    end
  end
  
  context "Should create resources passed as packages to install" do
    let(:params){{
      :packages_to_install => packages
    }}
    it do
      should contain_avst_tools_installations__avst_package_to_install('jvmtop').with(
        'package_ensure' => 'latest'
        )
    end
  end

end

