#!/bin/bash

# Unseal Vault
[ -f $HOME/vault.json ] && {
  echo 'Unsealing Vault'

  v_addr='http://localhost:8200'
  v_keys=$(cat $HOME/vault.json | jq '.keys[]' | xargs)

  for key in $v_keys; do
    vault operator unseal -address $v_addr $key
  done
}

