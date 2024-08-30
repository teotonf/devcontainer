# devcontainers

This is a devcontainer for using devops tools.

## Folders
- **.devcontainer** : configuration of the devcontainer and an initializer script
- **compose**: a docker-compose file containing configurations for hashicorp vault, pgadmin and the devops tools.
- **docker**: docker image with a set of tools such as ansible, kubectl, terraform and others


## Tips

For a auto-unseal proccess, you can save the output of Vault first action as vault.json file in root folder.


This configuration suppose that docker is configured to be secure, so I use certificates and also a key password.

Im using zsh as base-shell and has some configured plugins and theme. 

All those codes are writen in the initializer script

Define those environment variables
```sh
# in $HOME/.bashrc or $HOME/.zshrc (depending on your shell)
export DEVOPS_WORKSPACE=<folder with the developments you want to inside your workspace in the container>
export KUBECONFIG_LOCATION=<kubeconfig file full location>
export CERTIFICATES_LOCATION=<certificates folder location, for access cloud repos, e.g.: bitbucket, github>
export SSH_KEYS_LOCATION=<your personal ssh configurations , e.g. : $HOME/.ssh>
export USER=<user for the container>
```

Remember to restart vscode to the environment variables to become available. Just using source command will not work.