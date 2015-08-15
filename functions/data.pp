function nodejs::data {
  $user = $::boxen_user
  $prefix = $::boxen::config::home
  $results = {
    'nodejs::prefix' => "${prefix}",
    'nodejs::provider' => 'nodenv',
    'nodejs::user' => "${user}",
    'nodejs::build::ensure' => 'f18b3d67756d1cb25ba6e35044f816fd67211b33',
    'nodejs::build::prefix' => "${prefix}/node-build",
    'nodejs::build::user' => "${user}",
    'nodejs::nodenv::ensure' => 'v0.2.0',
    'nodejs::nodenv::prefix' => "${prefix}/nodenv",
    'nodejs::nodenv::user' => "${user}"
  }
}
