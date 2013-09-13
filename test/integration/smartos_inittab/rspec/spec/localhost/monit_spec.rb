require 'spec_helper'

describe command('pgrep monit') do
  it { should return_exit_status 0  }
end
