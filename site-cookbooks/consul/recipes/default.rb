bash "install_consul" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget "https://dl.bintray.com/mitchellh/consul/0.3.1_linux_amd64.zip"
  unzip 0.3.1_linux_amd64.zip
  cp consul /usr/local/bin
  EOH
  not_if "test -f /usr/local/bin/consul"
end
