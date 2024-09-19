#!/bin/bash

cat <<EOF >> $HOME/.zshrc
# Add kubectl alias
alias k='f() { kubectl \$@; }; f "\$@" '
alias kc='f() { kubectx \$@; }; f "\$@" '
alias ks='f() { kubens \$@; }; f "\$@" '
alias ke='f() { kubectl get events \$@; }; f "\$@" '

# Tools
alias pg-enable='kubectl port-forward svc/main-kubegres -n kubegres --address 0.0.0.0 25432:5432'
EOF

# Cloning Dracula theme for zsh
git clone https://github.com/dracula/zsh.git $HOME/dracula-zsh

# Generating a symbolic link
ln -s $HOME/dracula-zsh/dracula.zsh-theme $HOME/.oh-my-zsh/themes/dracula.zsh-theme

# Change theme
sed -e 's,^\(ZSH_THEME="\)[^"]*,\1dracula,g' -i $HOME/.zshrc

# Configure context
docker context rm secure-context && \
docker context create secure-context \
--description "context for secure docker" \
--docker "host=tcp://$NOTE_IP:2376,ca=$HOME/certificates/docker/ca.pem,cert=$HOME/certificates/docker/cert.pem,key=$HOME/certificates/docker/key.pem" &&\
docker context use secure-context

# Install Helm plugin
helm plugin install https://github.com/helm-unittest/helm-unittest.git
