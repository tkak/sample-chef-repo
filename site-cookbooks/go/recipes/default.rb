package "tar" do
  action :upgrade
end

remote_file "/usr/local/src/go1.3.1.linux-amd64.tar.gz" do
  source "https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz"
end

bash "go: install go" do
  user "root"
  code <<-EOH
    tar -C /usr/local -xzf /usr/local/src/go1.3.1.linux-amd64.tar.gz
    grep '/usr/local/go/bin' /etc/profile && echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
  EOH
end
