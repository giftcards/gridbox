require 'spec_helper'

describe 'gridbox::config' do
  let(:title) { 'static folder check' }

  it do
    should contain_file('/local/gridbox').with_ensure('directory')
  end
end

describe 'gridbox::config' do
  let(:title) { 'dynamic files check' }
  let(:pre_condition) { "class{ 'gridbox': }" }

  it do
    should contain_file('/local/gridbox/phantomjs').with(
      'ensure' => 'file',
      'mode' => '0755'
    )
    should contain_file('/etc/init.d/phantom').with(
      'ensure' => 'file',
      'mode' => '0755'
    )
    should contain_file('/etc/phantom.conf').with_ensure('file')
    should contain_file('/etc/phantom.conf').with_content(/.*WORKERS.*/)
    should contain_file('/etc/phantom.conf').with_content(/.*HOST.*/)
    should contain_file('/etc/phantom.conf').with_content(/.*PROXY.*/)

    should contain_file('/local/gridbox/selenium.jar').with_ensure('file')
    should contain_file('/etc/init.d/selenium').with(
      'ensure' => 'file',
      'mode' => '0755'
    )
    should contain_file('/etc/selenium.conf').with_ensure('file')
    should contain_file('/etc/selenium.conf').with_content(/.*TIMEOUT.*/)
  end

  context 'with selenium => false' do
    let(:pre_condition) { "class{ 'gridbox': selenium => false, }" }

    it do
      should contain_file('/local/gridbox/phantomjs').with(
        'ensure' => 'file',
        'mode' => '0755'
      )
      should contain_file('/etc/init.d/phantom').with(
        'ensure' => 'file',
        'mode' => '0755'
      )
      should contain_file('/etc/phantom.conf').with_ensure('file')
      should contain_file('/etc/phantom.conf').with_content(/.*WORKERS.*/)
      should contain_file('/etc/phantom.conf').with_content(/.*HOST.*/)
      should contain_file('/etc/phantom.conf').with_content(/.*PROXY.*/)

      should !contain_file('/local/gridbox/selenium.jar')
      should !contain_file('/etc/init.d/selenium')
      should !contain_file('/etc/selenium.conf')
    end
  end

  context 'with phantom => false' do
    let(:pre_condition) { "class{ 'gridbox': phantom => false, }" }

    it do
      should contain_file('/local/gridbox/selenium.jar').with_ensure('file')
      should contain_file('/etc/init.d/selenium').with(
        'ensure' => 'file',
        'mode' => '0755'
      )
      should contain_file('/etc/selenium.conf').with_ensure('file')
      should contain_file('/etc/selenium.conf').with_content(/.*TIMEOUT.*/)

      should !contain_file('/local/gridbox/phantomjs')
      should !contain_file('/etc/init.d/phantom')
      should !contain_file('/etc/phantom.conf')
    end
  end

  context 'with workers => 10' do
    let(:pre_condition) { "class{ 'gridbox': workers => 10, }" }

    it do
      should contain_file('/etc/phantom.conf').with_content(/.*WORKERS=10.*/)
    end
  end

  context 'with host => 10.0.0.1' do
    let(:pre_condition) { "class{ 'gridbox': host => '10.0.0.1', }" }

    it do
      should contain_file('/etc/phantom.conf').with_content(/.*HOST=10\.0\.0\.1.*/)
    end

  end

  context 'with timeout => 10' do
    let(:pre_condition) { "class{ 'gridbox': timeout => 10, }" }

    it do
      should contain_file('/etc/selenium.conf').with_content('TIMEOUT=10')
    end
  end

  context 'with proxy => 10.0.0.1' do
    let(:pre_condition) { "class{ 'gridbox': proxy => '10.0.0.1', }" }

    it do
      should contain_file('/etc/phantom.conf').with_content(/.*PROXY=10\.0\.0\.1.*/)
    end
  end
end
