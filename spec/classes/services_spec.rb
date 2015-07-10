require 'spec_helper'

describe 'gridbox::services' do
  let(:title) { 'services check' }
  let(:pre_condition) { "class{ 'gridbox': }" }

  it do
    should contain_service('phantom')
    should contain_service('selenium')
  end

  context 'with selenium => false' do
    let(:pre_condition) { "class{ 'gridbox': selenium => false, }" }

    it do
      should contain_service('phantom')
      should ! contain_service('selenium')
    end
  end

  context 'with phantom => false' do
    let(:pre_condition) { "class{ 'gridbox': phantom => false, }" }

    it do
      should contain_service('selenium')
      should ! contain_service('phantom')
    end
  end
end
