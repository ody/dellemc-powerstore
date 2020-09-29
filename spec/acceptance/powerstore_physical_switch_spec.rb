require 'spec_helper_acceptance'

describe 'powerstore_physical_switch' do
  it 'get physical_switch' do
    result = run_resource('powerstore_physical_switch')
    expect(result).to match(%r{ensure => 'present'}).or match(%r{Completed get, returning hash \[\]})
  end

  it 'create physical_switch' do
    pp = run_resource('powerstore_physical_switch', 'string', false)
    pp.gsub!("string", "string_1")
    make_site_pp(pp)
    result = run_device(allow_changes: true)
    expect(result).to match(%r{Applied catalog.*})
  end

  
  it 'update physical_switch' do
    pp = run_resource('powerstore_physical_switch', 'string', false)
    pp.gsub!("=> 'string'", "=> 'string_1'")
    pp.gsub!("=> false", "=> true")
    make_site_pp(pp)
    result = run_device(allow_changes: true)
    expect(result).to match(%r{Applied catalog.*})
  end


  it 'delete physical_switch' do
    pp = <<-EOS
    powerstore_physical_switch { 'string':
      ensure => absent,
    }
    EOS
    make_site_pp(pp)
    result = run_device(allow_changes: true)
    expect(result).to match(%r{Applied catalog.*})
  end
end