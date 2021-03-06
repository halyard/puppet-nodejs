Puppet::Functions.create_function(:'nodejs::data') do
  def data
    user = closure_scope.lookupvar('::boxen_user')
    prefix = closure_scope.lookupvar('::boxen::config::home')
    {
      'nodejs::prefix' => prefix,
      'nodejs::provider' => 'nodenv',
      'nodejs::user' => user,
      'nodejs::build::ensure' => '295e0d6819c53e80ed128b5baf1a8e5ec5620a7e',
      'nodejs::build::prefix' => "#{prefix}/node-build",
      'nodejs::build::user' => user,
      'nodejs::nodenv::ensure' => 'v0.3.0',
      'nodejs::nodenv::prefix' => "#{prefix}/nodenv",
      'nodejs::nodenv::user' => user
    }
  end
end
