require 'spec_helper'
describe 'tomcat_instance_framework' do

  context 'with defaults for all parameters' do
    it { should contain_class('tomcat_instance_framework') }
  end

end
