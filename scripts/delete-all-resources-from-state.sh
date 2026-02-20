#!/bin/sh

echo "You are about to delete the current resources from state for workspace $(terraform workspace show):"
echo "------------------------------------------------------------"

terraform state list

echo "------------------------------------------------------------"
read -p "Are you sure? " -n 1 -r
echo ""
if [[ ${REPLY} =~ ^[Yy]$ ]]
then
    echo "Proceeding"
    tofu state list | cut -f 1 -d '[' | xargs -L 1 tofu state rm
else
    echo "OK, bye"
fi

