# Gefins
Software project in Software Development I (HBV501G) at University of Iceland. 

## Authors 
Team 26
- Freyja Sigurgísladóttir, frs24@hi.is
- Henrietta Þóra Magnúsdóttir, hthm6@hi.is
- Jökull Jóhannsson, joj38@hi.is

## Ideology 
There is a market for giving and receiving goods as evidenced by large Facebook groups created for that purpose. Facebook groups are not optimised for the task as the items are not displayed in an organized manner and so the chances of a user finding what they’re looking for are slim.\n
Facebook has no system that keeps control of who is first in line of receiving, if an item has already been picked up or if a user decides not to pick up the item.\n
This web application aims to streamline that process by creating a system optimized for the task. The application is constructed in an organized manner and keeps control of user interaction. Protecting the environment is one of today’s pressing subjects. More and more people are becoming environmentally conscious and this website makes it easier for people to reduce their waste and pollution by giving and reusing.

## How do I get this ?
Your IDE ([IntelliJ](https://www.jetbrains.com/idea/), [Eclipse](https://eclipse.org/), [Spring Tool Suit](https://spring.io/tools)) should be able to clone a project from Github.
It should be easy to find information regarding how to do that for your chosen IDE.

## How do I run this ?
This project is setup using [Maven](https://maven.apache.org/what-is-maven.html) as a dependency manager, so if your IDE does not manage that, or you don't have it installed you can look [here](https://maven.apache.org/install.html) for further information.
When all the dependencies are downloaded, you can run the project by running the ``main()`` method in the class ``Application`` and then enter [localhost:8080](http://localhost:8080) into the address bar of your favorite web browser.




# SpringBootMVC - Original skeleton
Project skeleton for Software Project class in the University of Iceland.

## How do I get this ?
Your IDE ([IntelliJ](https://www.jetbrains.com/idea/), [Eclipse](https://eclipse.org/), [Spring Tool Suit](https://spring.io/tools)) should be able to clone a project from Github.
It should be easy to find information regarding how to do that for your chosen IDE.
It's also possible to download the project as a .zip [here](https://github.com/mbook/SpringBootMVC/archive/master.zip).

## How do I run this ?
This project is setup using [Maven](https://maven.apache.org/what-is-maven.html) as a dependency manager, so if your IDE does not manage that, or you don't have it installed you can look [here](https://maven.apache.org/install.html) for further information.
When all the dependencies are downloaded, you can run the project by running the ``main()`` method in the class ``Application`` and then enter [localhost:8080](http://localhost:8080) into the address bar of your favorite web browser.

## What is going on ?
Look at the code and find the comments I wrote. I tried explaining what was happening in such a way that it should hopefully be easy to understand. I recommend starting by looking at the [HomeController](https://github.com/danielpall/SpringBootMVC/blob/master/src/main/java/project/controller/HomeController.java#L26).

### What did you use to make this ?
I used IntelliJ Ultimate with Maven to setup this project. Students and Teachers get the Ultimate edition for free, apply [here](https://www.jetbrains.com/student/).

### Database
This project runs an internal database while it is running. If the project is restarted, then all data will be reset, i.e. no data will persist between restarts.
If you look at the [application.properties](https://github.com/danielpall/SpringBootMVC/blob/master/src/main/resources/application.properties) file, you can see how you can direct the project to use your own persistent database. The example shown is aimed at Postgres.

## What is this application showing ?  
This application is a small demonstration of using [Spring Boot](https://projects.spring.io/spring-boot/) to handle the full stack for the webapp. It handles the frontend using Jasper for jsp pages, which 
allows for dynamic pages. It handles the backend with MVC pattern and easy to use annotations, and interfaces to a repository of our choice, in this instance, an in memory database.
When the application is running, you can go to [http://localhost:8080/postit](http://localhost:8080/postit) for a demonstration for this tech stack.

It's a simple postit application where an user writes a _name_ and a _note_ and posts it to a list. All users posts will be visible with name and note. 

It's also possible to see notes from certain users by going to the url  [http://localhost:8080/postit/username](http://localhost:8080/postit/username) where _username_ is the name of the user you want to see the postit notes from.

### Where can I find help ?
In case of any questions, please refer to the "Spring Boot Intro" slides in the HBV501G Verkefni folder on Ugla, or contact your tutor.

### Credits
This skeleton project was created by Daníel Páll Jóhannsson while tutoring the HBV501G course in Fall 2015 and 2018.
