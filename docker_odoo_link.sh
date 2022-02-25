# ------- Environment variables ---------#

# Odoo Version 
VERSION= "v14"
BRANCH="14.0"

# cd /opt/odoo/$BRANCH/oca_repos

#------- Create soft links of all files in all directories of the folders in the OCA folder ------#

for dir in *
  do
  if [ $dir = "server" ]
    then
    continue
  else
    ln -s /opt/odoo/${BRANCH}/oca_repos/$dir/* /opt/odoo/${BRANCH}/custom_addons
    rm /opt/odoo/${BRANCH}/custom_addons/README.md
    rm /opt/odoo/${BRANCH}/custom_addons/LICENSE
    rm /opt/odoo/${BRANCH}/custom_addons/requirements.txt
  fi
done
