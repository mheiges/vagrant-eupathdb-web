require 'spec_helper'
describe 'ebrc_common_web_dirs' do

  context 'with defaults for all parameters' do
    it { should contain_class('ebrc_common_web_dirs') }
  end
end
