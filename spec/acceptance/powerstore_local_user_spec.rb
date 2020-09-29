require 'spec_helper_acceptance'

describe 'powerstore_local_user' do
  it 'get local_user' do
    result = run_resource('powerstore_local_user')
    expect(result).to match(%r{ensure => 'present'}).or match(%r{Completed get, returning hash \[\]})
  end

  it 'create local_user' do
    pp = run_resource('powerstore_local_user', 'string', false)
    pp.gsub!("string", "string_1")
    make_site_pp(pp)
    result = run_device(allow_changes: true)
    expect(result).to match(%r{Applied catalog.*})
  end

  
  it 'update local_user' do
    pp = run_resource('powerstore_local_user', 'string', false)
    pp.gsub!("=> 'string'", "=> 'string_1'")
    pp.gsub!("=> false", "=> true")
    make_site_pp(pp)
    result = run_device(allow_changes: true)
    expect(result).to match(%r{Applied catalog.*})
  end


  it 'delete local_user' do
    pp = <<-EOS
    powerstore_local_user { 'string':
      ensure => absent,
    }
    EOS
    make_site_pp(pp)
    result = run_device(allow_changes: true)
    expect(result).to match(%r{Applied catalog.*})
  end
end