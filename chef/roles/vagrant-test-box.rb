# Name of the role should match the name of the file
name "vagrant-test-box"

default_attributes(
    "build_essential" => {
        "compile_time" => true
    }
)

override_attributes(
    "mysql" => {
	"allow_remote_root" => true,
#	"root_network_acl" => "%",
        "server_root_password" => 'root',
        "server_repl_password" => 'repl',
        "server_debian_password" => 'debian'
    }
)

run_list(
	"recipe[apt]",	
  	"recipe[yum]",	
	"recipe[build-essential]",
#	"recipe[vim]",
#	"recipe[mysql]",
	"recipe[mysql::server]",
	"recipe[database::mysql]",
	"recipe[database::import]"
)
