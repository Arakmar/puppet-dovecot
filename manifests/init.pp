# Class: dovecot
#
# Install, enable and configure the Dovecot IMAP server.
# Options:
#  $plugins:
#    Array of plugin sub-packages to install. Default: empty
#
class dovecot (
    Array $plugins                    = [],
    # dovecot.conf
    String $protocols                  = undef,
    Optional[String] $listen                     = undef,
    Optional[String] $login_greeting             = undef,
    Optional[String] $login_trusted_networks     = undef,
    Optional[String] $verbose_proctitle          = undef,
    $shutdown_clients           = undef,
    # 10-auth.conf
    Boolean $disable_plaintext_auth     = true,
    Optional[String] $auth_username_chars        = undef,
    String $auth_mechanisms            = 'plain',
    Array $auth_include               = [ 'system' ],
    # 10-logging.conf
    Optional[String] $log_path                   = undef,
    Optional[String] $log_timestamp              = undef,
    Optional[String] $auth_verbose               = undef,
    Optional[String] $auth_debug                 = undef,
    Optional[String] $mail_debug                 = undef,
    # 10-mail.conf
    Optional[String] $mail_home                  = undef,
    Optional[String] $mail_fsync                 = undef,
    Optional[String] $mail_location              = undef,
    Optional[String] $mail_uid                   = undef,
    Optional[String] $mail_gid                   = undef,
    Optional[String] $mail_nfs_index             = undef,
    Optional[String] $mail_nfs_storage           = undef,
    Optional[String] $mail_privileged_group      = undef,
    Optional[String] $mail_plugins               = undef,
    Optional[String] $mmap_disable               = undef,
    Optional[String] $dotlock_use_excl           = undef,
    Boolean $include_inbox_namespace    = false,
    # 10-master.conf
    Optional[String] $default_process_limit      = undef,
    Optional[String] $default_client_limit       = undef,
    Optional[String] $auth_listener_userdb_mode   = undef,
    Optional[String] $auth_listener_userdb_user   = undef,
    Optional[String] $auth_listener_userdb_group  = undef,
    Boolean $auth_listener_postfix       = false,
    Optional[String] $auth_listener_postfix_mode  = undef,
    Optional[String] $auth_listener_postfix_user  = undef,
    Optional[String] $auth_listener_postfix_group = undef,
    Optional[String] $imap_login_process_limit   = undef,
    Optional[String] $imap_login_client_limit    = undef,
    Optional[String] $imap_login_service_count   = undef,
    Optional[String] $imap_login_process_min_avail = undef,
    Optional[String] $imap_login_vsz_limit       = undef,
    Optional[String] $pop3_login_service_count   = undef,
    Optional[String] $pop3_login_process_min_avail = undef,
    Optional[String] $default_vsz_limit          = undef,
    Optional[String] $auth_listener_default_user = undef,
    Integer $imaplogin_imap_port         = 0,
    Integer $imaplogin_imaps_port        = 0,
    Boolean $imaplogin_imaps_ssl         = false,
    Optional[String] $lmtp_unix_listener          = undef,
    Optional[String] $lmtp_unix_listener_mode     = undef,
    Optional[String] $lmtp_unix_listener_user     = undef,
    Optional[String] $lmtp_unix_listener_group    = undef,
    Optional[String] $lmtp_socket_group          = undef,
    Optional[String] $lmtp_socket_mode           = undef,
    Optional[String] $lmtp_socket_path           = undef,
    Optional[String] $lmtp_socket_user           = undef,
    # 10-ssl.conf
    Optional[String] $ssl                        = undef,
    String $ssl_cert                   = '/etc/pki/dovecot/certs/dovecot.pem',
    String $ssl_key                    = '/etc/pki/dovecot/private/dovecot.pem',
    Optional[String] $ssl_cipher_list            = undef,
    Optional[String] $ssl_protocols              = undef,
    Optional[String] $ssl_dh_parameters_length   = undef,
    String $ssl_dh                     = '/usr/share/dovecot/dh.pem',
    # 15-lda.conf
    Optional[String] $postmaster_address         = undef,
    Optional[String] $hostname                   = undef,
    Optional[String] $lda_mail_plugins           = undef,
    Optional[String] $lda_mail_location          = undef,
    Optional[String] $lda_mailbox_autocreate     = undef,
    Optional[String] $lda_mailbox_autosubscribe  = undef,
    # 15-mailboxes.conf.erb
    Optional[String] $trash_mailbox_expunge_days = undef,
    Optional[String] $junk_mailbox_expunge_days  = undef,
    # 20-imap.conf
    Optional[String] $imap_mail_plugins          = undef,
    Optional[String] $imap_client_workarounds    = undef,
    # 20-lmtp.conf
    Optional[String] $lmtp_mail_plugins          = undef,
    Boolean $lmtp_save_to_detail_mailbox = false,
    # 20-pop3.conf
    Optional[String] $pop3_mail_plugins          = undef,
    Optional[String] $pop3_uidl_format           = undef,
    Optional[String] $pop3_client_workarounds    = undef,
    # 20-managesieve.conf
    Boolean $manage_sieve               = false,
    Boolean $managesieve_service         = false,
    Integer $managesieve_service_count   = 0,
    # 90-sieve.conf
    String $sieve                      = '~/.dovecot.sieve',
    Optional[String] $sieve_after                = undef,
    Optional[String] $sieve_before               = undef,
    String $sieve_dir                  = '~/sieve',
    Optional[String] $sieve_max_actions          = undef,
    Optional[String] $sieve_max_redirects        = undef,
    Optional[String] $sieve_max_script_size      = undef,
    Optional[String] $sieve_quota_max_scripts    = undef,
    Optional[String] $sieve_quota_max_storage    = undef,
    Optional[String] $sieve_extensions            = undef,
    Optional[String] $recipient_delimiter         = undef,
    # 90-plugin.conf
    Optional[String] $fts                        = undef,
    # 90-quota.conf
    Optional[String] $quota                      = undef,
    Array $quota_warnings             = [],
    # auth-passwdfile.conf.ext
    Optional[String] $auth_passwdfile_passdb     = undef,
    Optional[String] $auth_passwdfile_userdb     = undef,
    # auth-sql.conf.ext
    Optional[String] $auth_sql_userdb_static     = undef,
    String $auth_sql_path              = '/etc/dovecot/dovecot-sql.conf.ext',
    # auth-ldap.conf.ext
    Optional[String] $auth_ldap_userdb_static    = undef,
    String $auth_master_separator      = '*',
    Integer $mail_max_userip_connections = 512,
    Boolean $first_valid_uid             = false,
    Boolean $last_valid_uid              = false,

    Boolean $manage_service              = true,
    Array $custom_packages             = [],
    Optional[String] $ensure_packages             = 'installed',

    Optional[String] $ldap_uris                   = undef,
    Boolean $quota_enabled               = false,
    Boolean $acl_enabled                 = false,
    Boolean $replication_enabled         = false,
    Boolean $shared_mailboxes            = false,
    Hash $options_plugins             = {},
) {
    if($replication_enabled) {
        assert_type(Hash, $options_plugins[replication])
        assert_type(String, $options_plugins[replication][mail_replica])
        assert_type(String, $options_plugins[replication][dsync_remote_cmd])
        assert_type(String, $options_plugins[replication][replication_full_sync_interval])
        assert_type(String, $options_plugins[replication][replication_dsync_parameters])
    }

    if $custom_packages == undef {
      case $::operatingsystem {
        'RedHat', 'CentOS': {
            $packages = ['dovecot','dovecot-pigeonhole']
        }
        /^(Debian|Ubuntu)$/:{
            $packages = ['dovecot-common','dovecot-imapd', 'dovecot-pop3d', 'dovecot-managesieved', 'dovecot-mysql', 'dovecot-ldap', 'dovecot-lmtpd']
        }
        'FreeBSD' : {
          $packages  = 'mail/dovecot2'
        }
        default: { fail("OS $::operatingsystem and version $::operatingsystemrelease is not supported.")
        }
      }
    } else {
      $packages = $custom_packages
    }

    case $::operatingsystem {
    'RedHat', 'CentOS': { 
        $directory = '/etc/dovecot'
        $prefix    = 'dovecot'
    } 
    /^(Debian|Ubuntu)$/:{
        $directory = '/etc/dovecot'
        $prefix    = 'dovecot'
    }
    'FreeBSD': {
        $directory = '/usr/local/etc/dovecot'
        $prefix    = 'mail/dovecot2'
    }
    default: { fail("OS $::operatingsystem and version $::operatingsystemrelease is not supported") }
    }

    # All files in this scope are dovecot configuration files
    if $manage_service {
      File {
        notify  => Service['dovecot'],
        require => Package[$packages],
      }
    }
    else {
      File {
        require => Package[$packages],
      }
    }

    # Install plugins (sub-packages)
    dovecot::plugin { $plugins: before => Package[$packages], prefix => $prefix }

    # Main package and service it provides
    package { $packages: ensure => $ensure_packages }
    if $manage_service {
      service { 'dovecot':
        enable    => true,
        ensure    => running,
        hasstatus => true,
        require   => File["${directory}/dovecot.conf"],
      }
    }

    # Main configuration directory
    file { "${directory}":
        ensure => 'directory',
    }
    file { "${directory}/conf.d":
        ensure => 'directory',
    }

    # Main configuration file
    file { "${directory}/dovecot.conf":
        content => template('dovecot/dovecot.conf.erb'),
    }

    # Configuration file snippets which we modify
    file { "${directory}/conf.d/10-auth.conf":
        content => template('dovecot/conf.d/10-auth.conf.erb'),
    }
    file { "${directory}/conf.d/10-director.conf":
        content => template('dovecot/conf.d/10-director.conf.erb'),
    }
    file { "${directory}/conf.d/10-logging.conf":
        content => template('dovecot/conf.d/10-logging.conf.erb'),
    }
    file { "${directory}/conf.d/10-mail.conf":
        content => template('dovecot/conf.d/10-mail.conf.erb'),
    }
    file { "${directory}/conf.d/10-master.conf":
        content => template('dovecot/conf.d/10-master.conf.erb'),
    }
    file { "${directory}/conf.d/10-ssl.conf":
        content => template('dovecot/conf.d/10-ssl.conf.erb'),
    }
    file { "${directory}/conf.d/15-lda.conf":
        content => template('dovecot/conf.d/15-lda.conf.erb'),
    }
    file { "${directory}/conf.d/15-mailboxes.conf":
        content => template('dovecot/conf.d/15-mailboxes.conf.erb'),
    }
    file { "${directory}/conf.d/20-imap.conf":
        content => template('dovecot/conf.d/20-imap.conf.erb'),
    }
    file { "${directory}/conf.d/20-lmtp.conf":
        content => template('dovecot/conf.d/20-lmtp.conf.erb'),
    }
    file { "${directory}/conf.d/20-managesieve.conf":
        content => template('dovecot/conf.d/20-managesieve.conf.erb'),
    }
    file { "${directory}/conf.d/20-pop3.conf":
        content => template('dovecot/conf.d/20-pop3.conf.erb'),
    }
    
    if $manage_sieve {
      file { "${directory}/conf.d/20-managesieve.conf":
          content => template('dovecot/conf.d/20-managesieve.conf.erb'),
      }
    }
    
    file { "${directory}/conf.d/90-sieve.conf":
        content => template('dovecot/conf.d/90-sieve.conf.erb'),
    }
    file { "${directory}/conf.d/90-quota.conf":
        content => template('dovecot/conf.d/90-quota.conf.erb'),
    }
    file { "${directory}/conf.d/90-plugin.conf":
        content => template('dovecot/conf.d/90-plugin.conf.erb'),
    }

    if($replication_enabled) {
      file { "${directory}/conf.d/99-replicator.conf":
          content => template('dovecot/conf.d/99-replicator.conf.erb'),
      }
    } else {
      file { "${directory}/conf.d/99-replicator.conf":
          ensure => absent
      }
    }

    file { "${directory}/conf.d/auth-passwdfile.conf.ext" :
        content => template('dovecot/conf.d/auth-passwdfile.conf.ext.erb'),
    }
    file { "${directory}/conf.d/auth-sql.conf.ext" :
        content => template('dovecot/conf.d/auth-sql.conf.ext.erb'),
    }
    file { '/etc/dovecot/conf.d/auth-ldap.conf.ext':
        content => template('dovecot/conf.d/auth-ldap.conf.ext.erb'),
    }
}

