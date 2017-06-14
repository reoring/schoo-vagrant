#
# Cookbook:: apache2
# Recipe:: mod_python
#
# Copyright:: 2008-2013, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform_family']
when 'debian'
  package 'libapache2-mod-python'
when 'suse'
  package 'apache2-mod_python' do
    notifies :run, 'execute[generate-module-list]', :immediately
  end
when 'rhel', 'fedora', 'amazon'
  package 'mod_python' do
    notifies :run, 'execute[generate-module-list]', :immediately
  end
when 'freebsd'
  if node['apache']['version'] == '2.4'
    package 'ap24-mod_python35'
  else
    package 'ap22-mod_python35'
  end
end

file "#{node['apache']['dir']}/conf.d/python.conf" do
  content '# conf is under mods-available/python.conf - apache2 cookbook\n'
  only_if { ::Dir.exist?("#{node['apache']['dir']}/conf.d") }
end

apache_module 'python'
