require 'spec_helper'

describe service('monit') do
  it { should be_running   }
end

describe service('sshd') do
  it { should be_monitored_by('monit') }
end
