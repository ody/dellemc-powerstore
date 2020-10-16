#!/opt/puppetlabs/puppet/bin/ruby

require 'spec_helper_acceptance_local'
require 'bolt_spec/run'

config_data = {
  'modulepath' => "#{__dir__}/../fixtures/modules"
}

inventory_data = YAML.load_file("#{__dir__}/../fixtures/inventory.yaml")

include BoltSpec::Run

describe "powerstore_volume_group" do
  it 'should perform volume_group_collection_query' do
    result = run_task("powerstore::volume_group_collection_query", 'prism', {}, config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')  
    expect(result[0]['value']['list']).not_to be_nil  
  end
  it 'should perform volume_group_instance_query' do
    result = run_task("powerstore::volume_group_instance_query", 'prism', {"id" => "string"}, config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')  
    expect(result[0]['value']).not_to be_nil  
  end
  it 'should perform volume_group_delete' do
    result = run_task("powerstore::volume_group_delete", 'prism', {"id" => "string"}, config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')  
	end
  it 'should perform volume_group_create' do
    result = run_task("powerstore::volume_group_create", 'prism', sample_task_parameters('volume_group_create'), config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')  
	end
  it 'should perform volume_group_add_members' do
    result = run_task("powerstore::volume_group_add_members", 'prism', sample_task_parameters('volume_group_add_members'), config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')  
	end
  it 'should perform volume_group_clone' do
    result = run_task("powerstore::volume_group_clone", 'prism', sample_task_parameters('volume_group_clone'), config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')  
	end
  it 'should perform volume_group_refresh' do
    result = run_task("powerstore::volume_group_refresh", 'prism', sample_task_parameters('volume_group_refresh'), config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')  
	end
  it 'should perform volume_group_remove_members' do
    result = run_task("powerstore::volume_group_remove_members", 'prism', sample_task_parameters('volume_group_remove_members'), config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')  
	end
  it 'should perform volume_group_restore' do
    result = run_task("powerstore::volume_group_restore", 'prism', sample_task_parameters('volume_group_restore'), config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')  
	end
  it 'should perform volume_group_snapshot' do
    result = run_task("powerstore::volume_group_snapshot", 'prism', sample_task_parameters('volume_group_snapshot'), config: config_data, inventory: inventory_data)
    expect(result[0]['status']).to eq('success')  
	end
  end