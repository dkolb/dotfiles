$packages = [
  'libglvnd',
  'xorg-server',
  'xorg-apps',
  'lightdm',
  'xmonad',
]

package { $enhancers: ensure => installed }

# rbenv install
class { 'rbenv':
  latest => true
}

$rbenv_versions = [
 '2.3.0',
 '2.3.1',
 '2.3.4',
 '2.4.1',
 '2.4.2',
 '2.4.3'
]

rbenv::plugin { 'rbenv/ruby-build': }
rbenv::plugin { 'tpope/rbenv-ctags': }

$rbenv_versions.each |String $version| {
  rbenv::build { $version: }
  rbenv::gem   { 'bundler': ruby_version => $version }
}
