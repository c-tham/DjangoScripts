#!/bin/sh
#*************************************************************
#* Welcome to Django folder and files readiness script Part #1
#* Created by Chia Tham. 
#* 2018.02.10. Free. No Warranty. Used As Is.
#* 
#* V1.00 - Initial 
#*************************************************************
clear
echo "*************************************************************"
echo "*************************************************************"
echo "Welcome to Django folders and files readiness"
echo "Version 1.00 - Part 1 (Initial Django files and folders)"
printf "Enter the Project name: "
read pname
printf "Enter the App name for the project: "
read aname
echo "*************************************************************"
echo "*************************************************************"
if [ -d $pname ]
then
    echo "Project '$pname' is exist! Skip step [1]"
else
    #******************************
    echo "** [1] Init Django Start Project"
    echo ">django-admin startproject $pname"
    django-admin startproject $pname 
    #******************************
fi
echo "*************************************************************"
if [ -d $pname/apps/$aname ]
then
    echo "App '$pname/apps/$aname' is exist! STOP!"
    echo "*************************************************************"
else
    #******************************
    if [ -d $pname/apps ]
    then
        echo "Folder of $pname/apps is exist! Skip step [2]"
        echo "*************************************************************"
    else
        echo "** [2] Create Apps folder in Project folder"
        echo ">mkdir $pname/apps"
        mkdir $pname/apps 
        echo "*************************************************************"
        #******************************
        echo ">touch $pname/apps/__init__.py"
        touch $pname/apps/__init__.py 
        echo "*************************************************************"
    fi
    #******************************
    echo "** [3] Init Django Start App"
    echo ">python ../manage.py startapp $aname"
    cd $pname/apps
    python ../manage.py startapp $aname
    echo "*************************************************************"
    #******************************
    if [ -d $aname ]
    then
        echo "** [4] Init Django Migration"
        cd ..
        echo "*************************************************************"
        #******************************
        echo ">python manage.py makemigrations"
        python manage.py makemigrations 
        echo "*************************************************************"
        #******************************
        echo ">python manage.py migrate"
        python manage.py migrate 
        echo "*************************************************************"
        echo "*************************************************************"
        #******************************
        echo "** Manual add codes below into  "$pname"/"$pname"/settings.py"
        echo '(a) Add the line below in the INSTALLED_APPS'
        echo "    'apps."$aname"', ### added this line!"
        echo "*************************************************************"
        echo "*************************************************************"
        #******************************
        echo "** To execute Django, type the command below."
        echo ">python manage.py runserver"
        echo "*************************************************************"
        #******************************
    else
        echo "Django Environment is not running!"
    fi
fi
echo "*************************************************************"
