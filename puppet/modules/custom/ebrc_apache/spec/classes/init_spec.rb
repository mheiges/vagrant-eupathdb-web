require 'spec_helper'
describe 'ebrc_apache' do

  context 'with defaults for all parameters' do
    it { should contain_class('ebrc_apache') }
  end
end
