require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
    c.path = '/sbin:/usr/bin'
  end
end

%w(git zsh).each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

describe file('/home/kitchen/.oh-my-zsh') do
  it { should be_directory }
end
