require 'spec_helper'
describe 'ebrc_yum_repo' do

  context 'with defaults for all parameters' do
    it { should contain_class('ebrc_yum_repo') }
  end
end
