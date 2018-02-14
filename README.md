# DjangoScripts

Two OSX shell scripts (1) django1.sh and (2) django2.sh


(1) django1.sh (To setup django folder and files)

* It will ask for "project-name" and "app-name". With the "project-name", it will execute the command "django-admin startproject project-name". If the script cannot find the "project-name" folder, it will assume you are NOT in the Django Environment. It will stop. If the script found the "project-name" folder, it will continue create "app-name" folder, create __init__.py file, and execute the command "python ../manage.py startapp app-name". It will resolves the Django migration issue. The last thing, the script will display the command to insert code into "project-name"/setting.py file.

* For example, our project-name is main and app-name is first_app. It will ask you manual insert the following code (    'apps.first_app', ### added this line!) into main/setting.py

* At this point, you will be able to execute the Django by typing "python manage.py runserver". You should be able to see the similar page — "It worked! Congratulations on your first Django-powered page....."

* To create another "app-name", run the django1.sh again with same project-name, but with different app-name.


(2) django2.sh (To setup HTML, CSS, and etc for django)

* It will ask for "project-name" and "app-name". It will insert codes into view.py file at "project-name"/apps/"app-name" folder. Then it will create urls.py file and insert codes into the file at "project-name"/apps/"app-name" folder. It will continue create templates, static, css folders and insert the html codes into index.html. It will check the Django migration issue and resolve it. The last thing, the script will display the command to insert codes into "project-name"/urls.py file.

* For example, our project-name is main and app-name is first_app. It will ask you manual insert the following code (        url(r'^', include('apps.first_app.urls')), ### add this line) and (include  ### added 'include') into main/urls.py

* At this point, you will be able to execute the Django by typing "python manage.py runserver". You should be able to see the similar page — "Hello first_app app!"

(3) Errors

* You must manual insert codes for "project-name"/setting.py file and "project-name"/urls.py file.



