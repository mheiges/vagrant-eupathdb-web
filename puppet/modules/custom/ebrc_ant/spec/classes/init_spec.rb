require 'spec_helper'
describe 'ebrc_ant' do

  context 'with defaults for all parameters' do
    it { should contain_class('ebrc_ant') }
  end
end
