#!/bin/bash

# Create a directory structure for a tech project
mkdir techstart
mkdir techstart/project
mkdir techstart/project/teams
mkdir techstart/project/teams/developers
mkdir techstart/project/teams/developers/scripts
echo -e "#!/bin/bash\necho \"Building application...\"\necho \"Build completed on \$(date)\"" > techstart/project/teams/developers/scripts/build.sh
mkdir techstart/project/teams/developers/scripts/shared
mkdir techstart/project/teams/developers/operations
mkdir techstart/project/teams/developers/operations/maintenance
echo -e "#!/bin/bash\necho \"Performing system backup...\"\necho \"Backup completed on \$(date)\"" > techstart/project/teams/developers/operations/maintenance/backup.sh
mkdir techstart/project/teams/developers/operations/maintenance/logs
mkdir techstart/project/config
touch techstart/project/config/app.properties
mkdir techstart/project/backups
touch techstart/project/backups/test.conf.backup
mkdir techstart/project/logs
echo -e "DB_USER=admin\nDB_PASSWORD=secret\nAPI_KEY=12345" > techstart/project/config/.env
echo -e "\# Security Configuration\nSecurity_LEVEL=HIGH\nENCRYPTION=AES256" > techstart/project/config/security.conf
mkdir techstart/project/shared
mkdir techstart/project/shared/resources
chmod 750 techstart/project/teams/developers
chmod 750 techstart/project/teams/developers/operations
chmod 755 techstart/project/shared
chmod 400 techstart/project/config/security.conf
chmod 440 techstart/project/config/.env
chmod 644 techstart/project/config/app.properties

chmod +x techstart/project/teams/developers/scripts/build.sh
chmod +x techstart/project/teams/developers/operations/maintenance/backup.sh


# Adding the developers group
sudo groupadd developers
sudo groupadd operations

sudo usermod -aG developers $USER

# adding the admin user
sudo useradd admin

# Setting permissions
sudo chown -R :developers techstart/project/teams/developers/scripts
sudo chown -R :developers techstart/project/teams/developers/operations
sudo chown admin:operations techstart/project/teams/developers/operations/maintenance/backup.sh
sudo chown admin:developers techstart/project/teams/developers/scripts/build.sh





# Permission	Value
# Read (r)	4
# Write (w)	2
# Execute (x)	1
