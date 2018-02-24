function cai_vpn --description 'cai_vpn (p|np) (u|d|s)'
  if test (count $argv) -ne 2
    printf "%s\n" \
    'cai_vpn (p|np) (up|down)' \
    '  p    prod account' \
    '  np   nonprod account' \
    '  u    bring up OpenVPN connection to awsmetnp account.'  \
    '  d    shutdown OpenVPN connection ato awsmetnp account.' \
    '  s    status of the systemd service.'
  end

  switch $argv[1]
    case 'p'
      set acct_alias awsmet
    case 'np'
      set acct_alias awsmetnp
    case *
      printf "%s\n" "$argv[1] is not p or np."
      return 1
  end

  if test ! -r "/etc/openvpn/client/$acct_alias.conf"
    printf "%s\n" \
      "/etc/openvpne/client/awsmetnp.conf doesn't exist. Please login to the" \
      "awsmetnp account, login, download the client.ovpn file provided, " \
      "and then move it to that location/name." \
      "" \
      "Also it might be useful to install openvpn if you haven't and ensure " \
      "your distro's package supports the openvpn-client@.service pattern."
  end

  set service_name "openvpn-client@$acct_alias"

  switch $argv[2]
    case 'u'
      systemctl start  "$service_name"
    case 'd'
      systemctl stop   "$service_name"
    case 's'
      systemctl status "$service_name"
    case *
      printf "%s\n" \
        "Um.  $argv[2] is not u, d, or s. Try again. With correct inputs."
  end
end
