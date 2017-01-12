require 'spec_helper'
 
package_to_install = "jvmtop"
package_ensure = "installed"

describe 'avst_tools_installations::avst_package_to_install', :type => 'define' do
    let('title'){package_to_install}

    context "Should install package and not create script by default" do
        let(:params){{
            'package_name' => package_to_install,
        }}
        it do
            should contain_package(package_to_install).with(
                'ensure' => package_ensure,
                )
        end
    end

end