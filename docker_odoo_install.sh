###############################################################
# Installing Odoo v14 on Linux Debian 11 (could be used for other version too)
###############################################################
# Authors: Dayamin Solano and CEBANC Programation ERP Team
#-------------------------------------------------------------------------------
# This script will install Odoo on your Debian 11.0 server / ubuntu . It can install multiple Odoo instances
# in one Debian because of the different xmlrpc_ports
#-------------------------------------------------------------------------------
##################################################################################


###Create the volume 
    docker volume create name (example: odoo14_data)
###Create the container the explanation:
### -it: allows access to the terminal
### /opt: is the location in the container where the volume will process the data.
### -p: Indicates which ports we want to have open (it is recommended to use as termination 
### the corresponding odoo version: 8012, 8013, 8014... etc.) being the first one the port we 
### will enter in the browser, and the second one the one we will enter in the odoo configuration file (.odoorcXX).
    docker run -it -p 8014:8069 -v odoo14_db:/opt --name odoo14 debian:11
### Update Server - update repositories using 'apt'  -- could use: 'apt-get update && apt-get upgrade'
    apt update 
### Upgrade Server - upgrade repositories using 'apt'
    apt upgrade
### When deployed servers may lack resources such as the ability to run 'add-apt' and cannot add new repositories, 
### to solve this run the following
    apt-get install software-properties-common 
### Extra packages available we add the universe repositories  -- UBUNTU
    add-apt-repository universe
### WKHTMLTOPDF download links === Debian / Ubuntu === (for other distributions please replace this links)
### The installation of 'wkhtmltopdf' libraries are required for printing pdf documents 
    apt install wkhtmltopdf
### Install PostgreSQL Server 
    apt install postgresql
### Once the 'postgresql' is installed we proceed to make small adjustments. The file to edit is 'pg_hba.conf', 
### so that it recognizes the nano command, install the package 'nano'     
    apt install nano
    nano /etc/postgresql/13/main/pg_hba.conf  ### In the line ' local is for Unix domain socket connections only ...
    ### change --local all all peer -- to -- local all all md5 -- 
    su postgres
### Creating the PostgreSQL User --in this case, the user will create databases, will not create roles, the name is postgres, 
### will not be superuser, pwprompt' to ask for the password
    createuser --createdb --no-createrole --username postgres --no-superuser --pwprompt odoo14   ###request the password twice
### Make sure to log out the user 'postgres'
    exit 
### Restart 'postgresql' service
    service postgresql restart
### Install git, python3, pip3 and related dependencies
    apt-get install git python3 python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt1-dev -y
    apt-get install libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less gdebi -y
    apt install libpq-dev
    pip3 install psycopg2-binary
    pip3 install psycopg2
    apt install link openssl     # pip3 install link openssl 
### Now, install the dependencies using the requirements.txt file from the odoo server, to make sure that install the updated libraries, 
### Access the file located in github    
    pip3 install -r https://github.com/odoo/odoo/raw/14.0/requirements.txt 
### Odoo requires the installation of Nodejs, NPM and RTLCSS for LTR support.
    apt-get install nodejs npm
    npm install -g rtlcss
### Install SASS libraries (Syntactically Awesome Styleshees): The SASS language is called SassScript. Sass is a CSS extension, adds power and  
### elegance to the basic language. The preprocessor was originally based on the YAML markup language, before it introduced its own scripting language. 
    pip3 install libsass
### For security reasons, we have to create an alternative user to root to run the applications. We will first create the user for ODOO:
### --shell=/bin/bash: is the terminal type assigned to the user. 
### --home: is the root folder that will be assigned to the user.
### At the end what we indicate is the name that will be assigned to the user.
    adduser --system --quiet --shell=/bin/bash --home=/opt/odoo --gecos 'ODOO' --group odoo    
### Odoo user mode:
    su odoo
### Create the odoo/v14 folders
    mkdir odoo && mkdir odoo/v14
### Be located inside the odoo/v14 folders  
    cd odoo/v14/
### Download the source code from Github, from the 'OCB' repository located in the 'OCA' project inside the Server folder. With the -b 14.0 parameter
### we indicate to download the 14.0 branch; --depth 1 indicates to download the latest and not add the commit history, reducing the local load. 
### 'Server' is added at the end to indicate that we want to call server to the repository.    
    git clone -b 14.0 --depth 1 https://github.com/OCA/OCB.git server
### Download the source code of spanish audit from Github, from the 'l10n-spain' repository located in the 'OCA' project
    git clone -b 14.0 https://github.com/OCA/l10n-spain.git oca_repos
### Go to oca_repos folder
    cd oca_repos
    nano odoo14_dep.sh
    sh odoo14_dep.sh     ### Download the source code to deploy from Github, from the 'odoo14_dep.sh' repository located in the 'odoo_utils' project 
### Go to v14 folder
    cd ..
    nano odoo14_link.sh
    sh odoo14_link.sh    ### Download the source code to deploy from Github, from the 'odoo14_link.sh' repository located in the 'odoo_utils' project 

    chown -R odoo:odoo /opt/*    
### Go to Server folder
    cd server    
    ./odoo-bin -s --stop-after-init
### Go to Home folder 
    cd
### To create the Odoo configuration file. The created file will be named '.odoorc' and will be saved in the home of the user who launches the Odoo service.
    nano .odoorc  ### Change the data for the correct functioning of Odoo: addons_path = we will create a path for the custom_addons /odoo/v14/custom_addons,
### db_password = 1234, db_user = odoo14, limit_time_cpu=6000, limit_time_real=120000
### Go to Server folder
    cd server   
### Start the service by adding a parameter to the startup script -s means save, this parameter is only used the first time. 
    ./odoo-bin  