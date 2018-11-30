# Gefins
Software project in Software Development I (HBV501G) at University of Iceland. 
<br/><br/>
This web application allows its users to create an account, post ads for free items or browse throught the site's free items. 
<br/>
Users can get in queue for items, an ad's owner can accept a user as the receiver of the item in the ad and finally both owner and receiver can rate each other in the form of stars (one to five stars). 

## Authors 
Team 26
- Freyja Sigurgísladóttir, frs24@hi.is
- Henrietta Þóra Magnúsdóttir, hthm6@hi.is
- Jökull Jóhannsson, joj38@hi.is

## Ideology 
There is a market for giving and receiving goods as evidenced by large Facebook groups created for that purpose. Facebook groups are not optimised for the task as the items are not displayed in an organized manner and so the chances of a user finding what they’re looking for are slim.
<br/>
Facebook has no system that keeps control of who is first in line of receiving, if an item has already been picked up or if a user decides not to pick up the item.
<br/><br/>
This web application aims to streamline that process by creating a system optimized for the task. The application is constructed in an organized manner and keeps control of user interaction. 
<br/><br/>
Protecting the environment is one of today’s pressing subjects. More and more people are becoming environmentally conscious and this website makes it easier for people to reduce their waste and pollution by giving and reusing.

## How do I get this ?
Your IDE ([IntelliJ](https://www.jetbrains.com/idea/), [Eclipse](https://eclipse.org/), [Spring Tool Suit](https://spring.io/tools)) should be able to clone a project from Github.
It should be easy to find information regarding how to do that for your chosen IDE.

## How do I run this ?
To run the project locally you have to have PostgreSQL server running on your computer. If you don't have it already installed on your computer you can download it [here](https://www.postgresql.org/download).
<br/>
When download has finished follow the instructions to setup PostgreSQL and create an account. After setup, add the URL to your database and its name and password in the application.properties file in the project.
<br/>
This project is setup using [Maven](https://maven.apache.org/what-is-maven.html) as a dependency manager, so if your IDE does not manage that, or you don't have it installed you can look [here](https://maven.apache.org/install.html) for further information.
When all the dependencies are downloaded, you can run the project by running the ``main()`` method in the class ``Application`` and then enter [localhost:8080](http://localhost:8080) into the address bar of your favorite web browser.
