zsh_user =  node['oh_my_zsh']['user']
zsh_user_home = "/home/#{node['oh_my_zsh']['user']}"

%w(zsh git).each do |p|
  package p do
    action :upgrade
  end
end

git "#{zsh_user_home}/.oh-my-zsh" do
  user zsh_user
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  revision "master"
  action :sync
end

bash 'setup .zshrc' do
  user zsh_user
  cwd zsh_user_home
  code <<-EOH
    cp .oh-my-zsh/templates/zshrc.zsh-template .zshrc
  EOH
end

user zsh_user do
  shell '/bin/zsh'
end
