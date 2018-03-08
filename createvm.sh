group=pakuecontainerdemo1
vm=pakuedocker

az group create -n $group -l japaneast
az vm create -n $vm -g $group --image ubuntults --ssh-key-value ~/.ssh/id_rsa.pub
az vm list-ip-addresses -n $vm -o json | jq -r '.[0].virtualMachine.network.publicIpAddresses[0].ipAddress' | echo -e "[dockerhosts]\n$(cat)" > hosts
ansible-playbook -i hosts playbook.yml
cat hosts
