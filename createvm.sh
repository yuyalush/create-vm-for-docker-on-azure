group=pakuecontainerdemo0
vm=pakuedocker
location=japaneast
user=$(whoami)

az group create -n $group -l $location -o table

if [ -e ~/.ssh/id_rsa.pub ]; then
  az vm create -n $vm -g $group --image ubuntults --ssh-key-value ~/.ssh/id_rsa.pub -o table
else
  az vm create -n $vm -g $group --image ubuntults --generate-ssh-keys -o table
fi

az vm list-ip-addresses -n $vm -o json | jq -r '.[0].virtualMachine.network.publicIpAddresses[0].ipAddress' | echo -e "[dockerhosts]\n$(cat)" > hosts
ansible-playbook -i hosts playbook.yml
cat hosts
