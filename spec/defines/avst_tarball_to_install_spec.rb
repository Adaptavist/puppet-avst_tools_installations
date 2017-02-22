require 'spec_helper'
 
tool_to_install = "jvmtop"
download_command = "wget"
tarball_file_name = 'download_jvmtop.tar.cz'
download_url = "http://server.com/#{tarball_file_name}"
download_location = '/tmp'
extract_command = 'tar -zxvf'
extract_location = '/usr/share'
script_path          = '/tmp/script.sh'
script_user          = 'root'
script_group         = 'root'
script_mask          = '0755'
create_script       = 'true'

describe 'avst_tools_installations::avst_tarball_to_install', :type => 'define' do
    let('title'){tool_to_install}

    context "Should download tar from url, extract it and not create script by default" do
        let(:params){{
            'download_command' => download_command,
            'download_url' => download_url,
            'download_location' => download_location,
        }}
        it do
            should contain_exec("download_#{tool_to_install}_tarball").with(
                'command'   => "#{download_command} #{download_url}",
                'cwd' => "#{download_location}",
                )
            should contain_exec("extract_#{tool_to_install}_tarball").with(
                'command'     => "#{extract_command} #{download_location}/#{tarball_file_name} -C #{extract_location}",
                )
        end
    end

    context "Should download tar from url, extract it and create script" do
        let(:params){{
            'download_command' => download_command,
            'download_url' => download_url,
            'download_location' => download_location,
            'script_path' => script_path,
            'create_script' => create_script,
        }}
        it do
            should contain_exec("download_#{tool_to_install}_tarball").with(
                'command'   => "#{download_command} #{download_url}",
                'cwd' => "#{download_location}",
                )
            should contain_exec("extract_#{tool_to_install}_tarball").with(
                'command'     => "#{extract_command} #{download_location}/#{tarball_file_name} -C #{extract_location}",
                )
            should contain_file(script_path).with(
                'ensure'  => 'file',
                'owner'   => script_user,
                'group'   => script_group,
                'mode'    => script_mask,
                )
        end
    end
end