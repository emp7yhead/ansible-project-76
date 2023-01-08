export ANSIBLE_VAULT_PASSWORD_FILE=$(CURDIR)/vault-password

prepare-vault-password:
	touch vault-password

view-vault:
	ansible-vault view group_vars/webservers/vault.yml

edit-vault:
	ansible-vault edit group_vars/webservers/vault.yml

ping:
	ansible webservers -i inventory.ini -a 'ping'

deploy:
	ansible-playbook playbook.yml -i inventory.ini

install-roles:
	ansible-galaxy install -r requirements.yml

install-collections:
	ansible-galaxy collection install -r requirements.yml

install: install-roles install-collections
