#!/bin/sh
#*************************************************************
#* Welcome to Django folder and files readiness script Part #2
#* Created by Chia Tham. 
#* 2018.02.10. Free. No Warranty. Used As Is.
#* 
#* V1.00 - Initial 
#*************************************************************
clear
echo "*************************************************************"
echo "*************************************************************"
echo "Welcome to Django folders and files readiness"
echo "Version 1.00 - Part 2 (Django URLS and Views files)"
printf "Enter the Project name: "
read pname
printf "Enter the App name for the project: "
read aname
echo "*************************************************************"
echo "*************************************************************"
if [ -d $pname/apps/$aname ]
then
    cd $pname/apps
    #******************************
    echo "** [1] Insert codes into view.py at $pname/apps/$aname"
    echo 'from django.shortcuts import render, HttpResponse, redirect' >> $aname/views.py
    echo ' ' >> $aname/views.py
    echo 'def index(request):' >> $aname/views.py
    echo '    context = {' >> $aname/views.py
    echo '        "name" : "'$aname'"' >> $aname/views.py
    echo '    }' >> $aname/views.py
    echo '    return render(request, "'$aname'/index.html", context)' >> $aname/views.py
    cat $aname/views.py
    echo "*************************************************************"
    #******************************
    echo "** [2] Create urls.py at $pname/apps/$aname"
    echo ">touch $pname/apps/$aname/urls.py"
    touch $aname/urls.py 
    echo "*************************************************************"
    #******************************
    echo "** [3] Insert codes into urls.py at $pname/apps/$aname"
    echo 'from django.conf.urls import url' >> $aname/urls.py
    echo 'from . import views' >> $aname/urls.py
    echo ' ' >> $aname/urls.py
    echo 'urlpatterns = [' >> $aname/urls.py
    echo "    url(r'^$', views.index)" >> $aname/urls.py
    echo ']' >> $aname/urls.py
    cat $aname/urls.py
    echo "*************************************************************"
    #******************************
    echo "** [4] Create templates folders at $pname/apps/$aname/templates/$aname"
    echo ">mkdir $aname/templates/$aname"
    mkdir $aname/templates 
    mkdir $aname/templates/$aname 
    echo "*************************************************************"
    #******************************
    echo "** [5] Create Index.html file at $pname/apps/$aname/templates/$aname"
    echo ">touch $aname/templates/$aname/index.html"
    touch $aname/templates/$aname/index.html 
    echo "*************************************************************"
    #******************************
    echo "** [6] Insert codes into index.html at $pname/apps/$aname/templates/$aname"
    echo '<!DOCTYPE html>' >> $aname/templates/$aname/index.html
    echo '<html>' >> $aname/templates/$aname/index.html
    echo '<head>' >> $aname/templates/$aname/index.html
    echo '    <meta charset="utf-8">' >> $aname/templates/$aname/index.html
    echo '    <title>{{name}}</title>' >> $aname/templates/$aname/index.html
    echo '    {% load static %}' >> $aname/templates/$aname/index.html
    echo '    <!-- The line above tells Django to be ready to listen for static files -->' >> $aname/templates/$aname/index.html
    echo "    <link rel='stylesheet' href='{% static '"$aname"/css/styles.css' %}' media='screen' title='no title'  charset='utf-8'>" >> $aname/templates/$aname/index.html
    echo '    <!-- Put the static files in the static folder inside your app. -->' >> $aname/templates/$aname/index.html
    echo '    <!-- Django collects files within all static folders and puts them within a single folder --> ' >> $aname/templates/$aname/index.html
    echo '</head>' >> $aname/templates/$aname/index.html
    echo '<body>' >> $aname/templates/$aname/index.html
    echo '    <h1>Hello {{name}} app!</h1>' >> $aname/templates/$aname/index.html
    echo '</body>' >> $aname/templates/$aname/index.html
    echo '</html>' >> $aname/templates/$aname/index.html
    cat $aname/templates/$aname/index.html
    echo "*************************************************************"
    #******************************
    echo "** [7] Create static CSS folder at $pname/apps/$aname/static/$aname/css"
    echo ">mkdir $aname/static/$aname/css"
    mkdir $aname/static 
    mkdir $aname/static/$aname 
    mkdir $aname/static/$aname/css 
    echo "*************************************************************"
    #******************************
    echo "** [8] Create styles.css at $pname/apps/$aname/static/$aname/css"
    echo ">touch $aname/static/$aname/css/styles.css"
    touch $aname/static/$aname/css/styles.css 
    echo "*************************************************************"
    # #******************************
    echo "** [9] Init Django Migration"
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
    echo "** Manual add codes below into "$pname"/"$pname"/urls.py"
    echo '(a) Add include at the 1st line'
    echo "from django.conf.urls import url, include  ### added 'include'"
    echo ' '
    echo '(b) Add the line below (inside the urlpatterns)'
    echo "    url(r'^', include('apps."$aname".urls')), ### add this line"
    echo "*************************************************************"
    echo "*************************************************************"
    #******************************
    echo "** To execute Django, type the command below."
    echo ">python manage.py runserver"
    echo "*************************************************************"
    #******************************
else
    echo "App '$pname/apps/$aname' does not exist! STOP!"
fi
echo "*************************************************************"
