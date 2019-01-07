#!/bin/bash

##### Exit States
# 1 - no sudo access
# 2 - FAILURE of execiting some command

LOG=/tmp/stack.log 
rm -f $LOG
TOMCAT_URL=$(curl -s https://tomcat.apache.org/download-80.cgi | grep tar.gz | grep nofollow | head -1 | cut -d '"' -f2)
TOMCAT_DIR=$(echo $TOMCAT_URL | awk -F / '{print $NF}'  | sed -e 's/.tar.gz//')
STUDENT_WAR_URL=https://github.com/citb34/project-1-documentation/raw/master/studentapp.war
TOMCAT_USER=student

### Functions
Stat() {
    if [ "$1" == SKIP ]; then 
        echo -e "\e[35m - SKIP\e[0m"
    elif [ $1 -eq 0 ]; then 
        echo -e "\e[32m - SUCCESS\e[0m"
    else 
        echo -e "\e[31m - FAILURE\e[0m"
        echo -e "\n Please check the log file :: $LOG"
        exit 2
    fi
}

HEAD() {
    echo -e "\t\t\t\e[1;4;33m$1\e[0m"
}
## Check the script is been run as root use or normal user
if [ "$(id -u)" -ne 0 ]; then 
    echo "You should be a root user to execute this script. Try with sudo.."
    exit 1
fi


### Installing and Configuring HTTP Server
HEAD "WEB SERVER SETUP"
echo -n -e "  -> Installing HTTPD Server"
yum install httpd -y &>>$LOG
Stat $?

echo -n -e "  -> Configuring HTTPD Server"
echo -e 'ProxyPass "/student" "http://localhost:8080/student"\nProxyPassReverse "/student"  "http://localhost:8080/student"' > /etc/httpd/conf.d/studentapp.conf
STAT1=$?

wget -q https://raw.githubusercontent.com/citb34/project-1-documentation/master/httpd-index.html -O /var/www/html/index.html &>>$LOG
STAT2=$?

if [ $STAT1 -eq 0 -a $STAT2 -eq 0 ]; then 
    Stat 0
else 
    Stat 1
fi

echo -n -e "  -> Starting HTTPD Server" 
systemctl enable httpd &>>$LOG
systemctl restart httpd &>>$LOG
Stat $?

### Installing and configuring tomcat 
HEAD "TOMCAT SERVER SETUP"
echo -n -e "  -> Adding Tomcat User"
id $TOMCAT_USER &>>$LOG 
if [ $? -eq 0 ]; then 
    Stat SKIP 
else 
    useradd $TOMCAT_USER  &>>$LOG 
    Stat $?
fi

echo -n -e "  -> Installing Java"
yum install java -y &>>$LOG 
Stat $?

echo -n -e "  -> Downloading and extracting Tomcat"
cd /home/$TOMCAT_USER
wget -qO- $TOMCAT_URL | tar -xz &>>$LOG
Stat $?

echo -n -e "  -> Deploying Student Application"
cd /home/$TOMCAT_USER/$TOMCAT_DIR
rm -rf webapps/*
wget -q $STUDENT_WAR_URL -O webapps/student.war &>>$LOG 
Stat $? 

chown $TOMCAT_USER:$TOMCAT_USER /home/$TOMCAT_USER -R 

echo -n -e "  -> Configuring Tomcat Service"
wget https://raw.githubusercontent.com/citb34/project-1-documentation/master/tomcat-init -O /etc/init.d/tomcat &>>$LOG 
chmod ugo+x /etc/init.d/tomcat
Stat $? 

echo -n -e "  -> Starting Tomcat Service"
systemctl enable tomcat &>>$LOG 
systemctl restart tomcat &>>$LOG 
Stat $?
