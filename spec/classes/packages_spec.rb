require 'spec_helper'

describe 'gridbox::packages' do
  let(:title) { 'packages check' }
  let(:pre_condition) { "class{ 'gridbox': }" }

  it do
    should contain_package('java-1.8.0-openjdk')
    should contain_package('freetype')
    should contain_package('fontconfig')
  end
end
