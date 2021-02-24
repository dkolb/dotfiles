function ghe --wraps 'gh'
  env GH_HOST=ghe.coxautoinc.com gh $argv;
end