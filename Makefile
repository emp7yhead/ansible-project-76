ping:
	ansible webservers -i inventory.ini -a 'ping'

uptime:
	ansible webservers -i inventory.ini -a 'uptime'

playbook:
	ansible-playbook playbook.yml -i inventory.ini

install-roles:
	ansible-galaxy install -r requirements.yml

install-collections:
	ansible-galaxy collection install -r requirements.yml

deploy: install-roles install-collections playbook
