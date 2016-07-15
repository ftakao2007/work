require 'spec_helper'
set :request_pty, true

### make
describe package('make') do
  it { should be_installed }
end

### patch
describe package('patch') do
  it { should be_installed }
end

### traceroute
describe package('traceroute') do
  it { should be_installed }
end

### perl
describe package('perl') do
  it { should be_installed }
end

### traceroute
describe package('traceroute') do
  it { should be_installed }
end

### openssh-clients
describe package('openssh-clients') do
  it { should be_installed }
end

### git
describe package('git') do
  it { should be_installed }
end

### wget
describe package('wget') do
  it { should be_installed }
end

### gcc-c++
describe package('gcc-c++') do
  it { should be_installed }
end

### screen
describe package('screen') do
  it { should be_installed }
end

### bind-utils
describe package('bind-utils') do
  it { should be_installed }
end

### strace
describe package('strace') do
  it { should be_installed }
end

### sysstat
describe package('sysstat') do
  it { should be_installed }
end

### lsof
describe package('lsof') do
  it { should be_installed }
end

### mailx
describe package('mailx') do
  it { should be_installed }
end

### zip
describe package('zip') do
  it { should be_installed }
end

### bzip2
describe package('bzip2') do
  it { should be_installed }
end

### net-tools
describe package('net-tools') do
  it { should be_installed }
end

### sudo
describe package('sudo') do
  it { should be_installed }
end

### pv
describe package('pv') do
  it { should be_installed }
end

### sendmail
describe package('sendmail') do
  it { should_not be_installed }
end

