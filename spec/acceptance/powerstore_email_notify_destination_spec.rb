require 'spec_helper_acceptance'

describe 'powerstore_email_notify_destination' do
  it 'get email_notify_destination' do
    result = run_resource('powerstore_email_notify_destination')
    expect(result).to match(%r{ensure => 'present'}).or match(%r{Completed get, returning hash \[\]})
  end

  it 'create email_notify_destination' do
    pp = run_resource('powerstore_email_notify_destination', 'string', false)
    pp.gsub!("string", "string_1")
    make_site_pp(pp)
    result = run_device(allow_changes: true)
    expect(result).to match(%r{Applied catalog.*})
  end

  
  it 'update email_notify_destination' do
    pp = run_resource('powerstore_email_notify_destination', 'string', false)
    pp.gsub!("=> 'string'", "=> 'string_1'")
    pp.gsub!("=> false", "=> true")
    make_site_pp(pp)
    result = run_device(allow_changes: true)
    expect(result).to match(%r{Applied catalog.*})
  end


  it 'delete email_notify_destination' do
    pp = <<-EOS
    powerstore_email_notify_destination { 'string':
      ensure => absent,
    }
    EOS
    make_site_pp(pp)
    result = run_device(allow_changes: true)
    expect(result).to match(%r{Applied catalog.*})
  end
end