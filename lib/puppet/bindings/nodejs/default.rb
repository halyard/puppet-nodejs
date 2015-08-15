Puppet::Bindings.newbindings('nodejs::default') do
  bind {
    name         'nodejs'
    to           'function'
    in_multibind 'puppet::module_data'
  }
end
