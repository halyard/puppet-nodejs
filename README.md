puppet-nodejs
===========

[![Puppet Forge](https://img.shields.io/puppetforge/v/halyard/nodejs.svg)](https://forge.puppetlabs.com/halyard/nodejs)
[![Dependency Status](https://img.shields.io/gemnasium/halyard/puppet-nodejs.svg)](https://gemnasium.com/halyard/puppet-nodejs)
[![MIT Licensed](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://tldrlegal.com/license/mit-license)
[![Build Status](https://img.shields.io/circleci/project/halyard/puppet-nodejs/master.svg)](https://circleci.com/gh/halyard/puppet-nodejs)

Module to handle nodejs version management with [nodenv](http://github.com/OiNutter/nodenv) for boxen, based on boxen's [ruby module](http://github.com/boxen/puppet-ruby)

## Changes from upstream

* Clean up meta files
* Set up CircleCI builds
* Switch to function bindings vs puppet-module-data

## Usage

In your hiera config:

```
"nodejs::provider": "nodenv"
"nodejs::user": "deploy"

# https://github.com/OiNutter/node-build/releases
"nodejs::build::ensure": "f18b3d67756d1cb25ba6e35044f816fd67211b33"
"nodejs::nodenv::ensure": "v0.2.0"

# nodenv plugins
"nodejs::nodenv::plugins":
  "nodenv-vars":
    "ensure": "ee42cd9db3f3fca2a77862ae05a410947c33ba09"
    "source": "OiNutter/nodenv-vars"

# Environment variables for building specific versions
# You'll want to enable hiera's "deeper" merge strategy
# See http://docs.puppetlabs.com/hiera/1/configuring.html#mergebehavior
"nodejs::version::env":
  "0.4.2":
    "CC": "gcc"

# Version aliases, commonly used to bless a specific version
# Use the "deeper" merge strategy, as with nodejs::version::env
"nodejs::version::alias":
  "0.10": "0.10.36"
  "0.12": "0.12.0"
  "iojs-1.6": "iojs-1.6.2"
```

In your manifest:

```puppet
# Set the global default node (auto-installs it if it can)
class { 'nodejs::global':
  version => '0.12'
}

# ensure a certain node version is used in a dir
nodejs::local { '/path/to/some/project':
  version => '0.12'
}

# ensure a npm module is installed for a certain node version
# note, you can't have duplicate resource names so you have to name like so
$version = "0.12"
npm_module { "bower for ${version}":
  module       => 'bower',
  version      => '~> 1.4.1',
  node_version => $version,
}

# ensure a module is installed for all node versions
npm_module { 'bower for all nodes':
  module       => 'bower',
  version      => '~> 1.4.1',
  node_version => '*',
}

# install a node version
nodejs::version { '0.12.2': }

# Installing nodenv plugin
nodejs::nodenv::plugin { 'nodenv-vars':
  ensure => 'ee42cd9db3f3fca2a77862ae05a410947c33ba09',
  source  => 'OiNutter/nodenv-vars'
}
```

## Required Puppet Modules

* [boxen](https://github.com/halyard/puppet-boxen)
* [repository](https://github.com/halyard/puppet-repository)

