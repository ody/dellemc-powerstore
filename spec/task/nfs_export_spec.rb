#!/opt/puppetlabs/puppet/bin/ruby

require 'spec_helper_acceptance_local'
require 'bolt_spec/run'

config_data = {
  'modulepath' => "#{__dir__}/../fixtures/modules",
}

inventory_data = YAML.load_file("#{__dir__}/../fixtures/inventory.yaml")

include BoltSpec::Run

describe 'powerstore_nfs_export' do
  it 'performs nfs_export_collection_query' do
    result = run_task('powerstore::nfs_export_collection_query', 'sut', {}, config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')
    expect(result[0]['value']).not_to be_nil
  end

  it 'performs nfs_export_instance_query' do
    result = run_task('powerstore::nfs_export_instance_query', 'sut', { 'id' => 'string' }, config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')
    expect(result[0]['value']).not_to be_nil
  end

  it 'performs nfs_export_delete' do
    result = run_task('powerstore::nfs_export_delete', 'sut', { 'id' => 'string' }, config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')
  end

  it 'performs nfs_export_create' do
    result = run_task('powerstore::nfs_export_create', 'sut', sample_task_parameters('nfs_export_create'), config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')
  end
end
