# Class to install and configure the server role ad trust agent
class easy_ipa::install::server::role::adtrustagent {
  #package
  package{$easy_ipa::package_trust_ad_agent_role:
    ensure => installed,
  } 
  -> exec { "server_install_${easy_ipa::ipa_server_fqdn}_role_ad_trust_agent":
    command   => "/usr/sbin/ipa-adtrust-install --add-agents",
    timeout   => 0,
    logoutput => 'on_failure',
    provider  => 'shell',
    onlyif    => "/usr/bin/ipa server-find --servrole='AD Trust agent' --name shell_escape(${easy_ipa::ipa_server_fqdn}) | grep -wqF shell_escape(${easy_ipa::ipa_server_fqdn})",
  }
}