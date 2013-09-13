require 'spec_helper'

describe service('monit') do
  it { should be_running   }
end
