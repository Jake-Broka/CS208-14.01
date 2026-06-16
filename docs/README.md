# CS208 Full Stack Final Project - Donut Shop Application

- Name: Jake broka
- GitHub: [https://github.com/Jake-Broka](https://github.com/Jake-Broka)
- Term: Summer 2026

## Project Description

This is my full-stack website for my summer course CS208 at Boise State University.
For this final project, students were given a template directory containing a basic NodeJS app, and using the Express module for routing, I created this application based off the project requirements. Using a MySQL database, the backend queries one of two databases to get menu items or reviews for a fictional donut shop, "Downtown Donuts", and displays a formatted version to the user. The user is able to write a review, and click on menu items to preview the items in another page. The site is also mobile-friendly, and will scale to fit most screens.

## Install the Database

To set up the database, run the `install_db.sh` script in the setup_scripts
directory. This script will install MariaDB and start the server running. You
only need to run this script once per Codespace.

```bash
./setup_scripts/install_db.sh
```

Use the following for questions that the script asks:

- Switch to unix_socket authentication [Y/n] n
- Change the root password? [Y/n] Y
  - Set the password to 12345
- Remove anonymous users? [Y/n] Y
- Disallow root login remotely? [Y/n] Y
- Remove test database and access to it? [Y/n] Y
- Reload privilege tables now? [Y/n] Y

Test to make sure the db is running:

```bash
sudo service mariadb status
```

You should see something similar to what is shown below.
```
* /usr/bin/mariadb-admin  Ver 10.0 Distrib 10.11.13-MariaDB, for debian-linux-gnu on x86_64
Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Server version          10.11.13-MariaDB-0ubuntu0.24.04.1
Protocol version        10
Connection              Localhost via UNIX socket
UNIX socket             /run/mysqld/mysqld.sock
Uptime:                 10 min 23 sec

Threads: 1  Questions: 90  Slow queries: 0  Opens: 33  Open tables: 26  Queries per second avg: 0.144
```

## Create the Database Tables

Create the initial tables by running the following command:

```bash
sudo mysql -u root -p < ./setup_scripts/create_menu_reviews.sql
```

Refer to the create_menu_reviews.sql file for details about the table and its fields.


Check to make sure the tables were created correctly
```bash
mysql -u root -p -e 'show databases;'
```

```
Enter password:
+--------------------+
| Database           |
+--------------------+
| cs208demo          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
```

## Install Dependencies

Install the required dependencies using npm:

```bash
npm install
```

## Run the Application

Start the application using the following command:

```bash
npm start
```

## Access the Application

On Codespaces, you can access the application by forwarding port 3000. Open the
forwarded port in your browser to view the application.

## Design Decisions

1. Adaptive menu - Since the menu pulls from a SQL database, if the client ever wishes to add or remove items from the menu, they are able to, and the site will update accordingly. Items are categorized into 4 sections of the menu: donuts, coffee, breakfast, and drinks. Those are the 4 main items shown on the sample menu given by the client. The client can enter which of the 4 types the new item is, and it will be added to the appropriate section of the digital menu.

2. Customer reviews - The client wished for a section for customers to post their thoughts, and so a review board is contained within the website. It displays comments in groups of 10 at a time with proper timestamps. Since any user input could be potentially used by a threat actor, their input is cleansed before entry, so no XSS or HTML injection can be achieved through the interactive text box.

3. Mobile scaling - Since many users will be accessing from a mobile device, all parts of the site are accessible to mobile users, and the site scales accordingly based on screen size. Ease of access for mobile users was a top priority for the client.

## Edge Cases
1. What happens if the server/API is unreachable? - If the server or API is unreachable, the site renders its error pug template, which tells the user something went wrong, and to try again later, without spewing error codes in their face. When an error occurs, it is printed to the console for development troubleshooting.

2. What happens if a user submits a comment with only whitespace? - If a user inputs only whitespace, the backend parses their comment and will not add the review if it is only whitespace, and instead prompts them to fill a real entry.

3. What happens if a user submits extremely long input? - The user is only able to input a review of up to 500 characters. The SQL table also will not accept anything longer

4. What happens if the user rapidly double-clicks the submit button? - Using a onsubmit event and a function to return true or false only when the review was submitted, the onsubmit event can be switched to true or false based on whether the site has finished loading before another submission is entered.

## Challenges and Learnings 
1. I struggled a lot with making sure everything on my site played nicely with the CSS and flex containers, especially on the mobile site. Eventually I realized that using pixels for everythings scaling wasn't good practice, especially on a mobile site, since mobile phone sizes can vary a lot. I swapped to VWs, rems, and percents of the screen to get my mobile site to display properly. I did the same for a few classes on the classic desktop site as well, but flexboxes seemed to handle window resizing a lot better on desktop than mobile. I also had to look up what media queries and the format for a responsive web design viewport element looked like for HTMl.

2. I had ran into an issue where if the user was trying to view an item that didn't exist in the path "/menu/FAKEITEMNAME", the server would crash. I had mainly been copy-pasting my API paths, so when I had modified the GET request to create a site based on the existence of an item, it would look in the SQL table to check for the item, and if it existed, everything was fine. But when it didn't exist, I forgot to add something to handle errors, and it took me longer than I'd like to admit to find that it was missing in my code.

## Citations

Doordash logo: https://1000logos.net/doordash-logo/

UberEats logo: https://1000logos.net/uber-eats-logo/

Timestamp formatting: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleDateString

More timestamp formatting: https://www.w3schools.com/jsref/jsref_tolocaledatestring.asp

Responsive web design: https://www.w3schools.com/css/css_rwd_viewport.asp

onsubmit event handling: https://stackoverflow.com/questions/926816/how-to-prevent-form-from-submitting-multiple-times-from-client-side

Spread operator: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax

Italiano font: https://fonts.google.com/specimen/Italianno?preview.script=Latn

Montserrat font: https://fonts.google.com/specimen/Montserrat

Generative AI was used in this project to aid in troubleshooting CSS rules, mainly fixing my mobile media query, and created the .dashes class to evenly space my menu items and their prices. It read through my pug syntax and corrected minor issues with my code. I fed Gemini a summary of the project requirements and client deliverables, and asked for feedback based off the deliverables and rubric.