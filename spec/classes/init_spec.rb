require 'spec_helper'

describe 'gridbox' do
  let(:title) { 'compile check' }

  it do
    should compile.with_all_deps
  end
end

describe 'gridbox' do
  let(:title) { 'init include check' }

  it do
    should contain_class('gridbox::packages')
    should contain_class('gridbox::config')
    should contain_class('gridbox::services')
  end
end

describe 'gridbox' do
  let(:title) { 'bad parameters checks' }

  context 'with phantom => false, selenium => false' do
    let(:pre_condition) { "class{ 'gridbox': phantom => false, selenium => false, }" }

    it do
      should ! compile.with_all_deps
    end
  end
end
