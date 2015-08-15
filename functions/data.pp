function nodejs::data {
  {
    'nodejs::prefix' => "${::boxen::config::home}",
    'nodejs::provider' => 'nodenv',
    'nodejs::user' => "${::boxen_user}",
    'nodejs::build::ensure' => 'f18b3d67756d1cb25ba6e35044f816fd67211b33',
    'nodejs::build::prefix' => hiera('nodejs::prefix') + '/node-build',
    'nodejs::build::user' => "${::boxen_user}",
    'nodejs::nodenv::ensure' => 'v0.2.0',
    'nodejs::nodenv::prefix' => hiera('nodejs::prefix') + '/nodenv',
    'nodejs::nodenv::user' => "${::boxen_user}"
  }
}
