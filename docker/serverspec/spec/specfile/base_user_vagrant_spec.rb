require 'spec_helper'
set :request_pty, true

### vagrantユーザが作成されていることの確認
describe user('vagrant') do
  it { should exist }
  it { should belong_to_group 'vagrant' }
  it { should have_uid '1000' }
  it { should have_home_directory '/home/vagrant' }
  it { should have_login_shell '/bin/bash' }
end
