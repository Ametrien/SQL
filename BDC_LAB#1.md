### Laboratory work №1 – SQL Server Installation

#### Theory

Microsoft SQL Server is a relational database management system. In this laboratory work we are going to use Microsoft SQL Server 2014. The logical components of a SQL Server System are:
* Databases
* Tables
*	Database Diagrams
* Indexes
* Views
* Schemes
* Synonyms
* Stored Procedures
* Triggers
* Functions
* Data Types
* Rules
* Sequences

#### №1 - System installation
1.	First of all, we have to download an .exe file, which will allow us to install the program. By clicking on it twice, we will open a new window. 
2.	Here we will have to click on the “Installation” in order to start the process of installation.

![Image 1](https://github.com/AnastasiaFAF172/SQL/raw/images/1.png)

3. Now we will have to enter the product key.
4. After entering the product key, we will be able to read license terms. In order to continue the installation process, we must agree with them.

![Image 2](https://github.com/AnastasiaFAF172/SQL/raw/images/2.png)

5.	Then the page “Global rules” will be open, where the assistant will go through a verification process.
6.	The next step is going to be “Product Updates”. To make this step more efficient, it’s highly recommended to have access to the internet. That will allow us to download us the up-to-date program file.
7.	The page “Install Setup Files” is meant to show some information that is connected to the process of downloading and installation of the files.
8.	In the next window called “Install Rules” we will use System configuration checker. Here we will be able to view a detailed report on the installation rules.

![Image 3](https://github.com/AnastasiaFAF172/SQL/raw/images/3.png)

9.	In this window called “Setup role” we will have to choose the first option.

![Image 4](https://github.com/AnastasiaFAF172/SQL/raw/images/4.png)

10.	This window is called “Feature Selection”. Here we can do a lot of things: modify the address of the stored files, read short description of features and select the needed ones.

![Image 5](https://github.com/AnastasiaFAF172/SQL/raw/images/5.png)

11.	In the window “Feature rules – SQL Server Setup” will be validated the configuration before installation.
12.	“Instance configuration” window is needed to specify the name of the instance.
13.	In “Server Configuration” window it’s necessary to attribute SQL Server services to the accounts of users.
14.	Then in “Database Engine Configuration” we select the type of authentication. 
15.	In the window, which is called “Analysis Server Configuration”, in our case everything has to remain implicit. 
16.	In “Reporting Service Configuration” we have to choose option “Reporting service”.
17.	Then we specify at least one administrator in “Distributed Relay Controller”.
18.	In “Distributed Relay Client” we shouldn’t change anything, so we go to the next step.
19.	The “Ready to install” window tells us that the system is ready to be installed.
20.	In the “Installation Progress” we can watch the installation process and the current state of installation.
21.	The installation process is successfully done when we see the “Complete” window.

![Image 6](https://github.com/AnastasiaFAF172/SQL/raw/images/6.png)

22.	Finally, we initialize the system by activating system services.

#### №2 - Server configuration and registration

The next step is to registrate the server using SQL Server Management Studio. What we have to do is:
1.	Activate «Start Screen» and select «Apps».
2.	Use option «Programs».
3.	Select «Microsoft SQL Server 2014» in the list of applications.
4.	Select option «SQL Server 2014 Management Studio» by clicking on it.
5.	A new window will be open. Here we will be able to choose the needed server type, server name, authentification type, login and password.

![Image 7](https://github.com/AnastasiaFAF172/SQL/raw/images/7.png)

6.	After clicking on “Connect”, a new window will appear. We can press F7 in order to visualize the right part of the window.
7.	In this window we right-click on server in “Object Explorer” and select the “Register” option in menu.
8.	A new window will appear on the screen. It is called “New Server Registration”. Here we can write or select a server name, choose an authentification type, rewrite a registered server name/
9.	In “Connection Properties” we can fix the connection propreties like database, network protocol, network packet size, conenction and execution time-outs.
10.	By clicking on “Test” we will be able to verify the needed settings, if needed.

#### №3 - Creation of SQL users

In order to connect to SQL Server, the user goes through two steps: Authentication and Mission Validation. Configuring Authentication Mode In SQL Server is a simple task. For this, the following steps are taken:

1.	Make a right click on the server in question in the “Object Explorer” window.
2.	Use the “Properties” option.
3.	In the “Select a page” field we will have to select “Security”.
4.	Then “Windows Authentication mode” or “SQL Server and Windows Authentication mode” has to be marked, depending on the type of authentication that SQL Server must provide.

The next thing to do is creating your own login and password. Follow the following steps:

1.	Click on a “+” in order to create a new login.
2.	Click on another “+” near “Security”.
3.	Right-click the “Logins” element.
4.	Activate the “New Login” option in the context menu.

![Image 8](https://github.com/AnastasiaFAF172/SQL/raw/images/8.png)

5.	Select “SQL Server Authentication” option.
6.	Introduce a new login in  the “Login Name” field.
7.	Introduce a new password in the “Password” field.
8.	Select the following radio buttons: 
  *	Enforce password policy
  *	Enforce password expiration
  *	User must change password at next login
9.	Do not select the following buttons, because it is optional in our case:
  *	Mapped to certificate
  *	Mapped to asymmetric key
  *	Mapped to credential
10.	 It is optional, but we can also select an implicit database in the “Default Database” field.
11.	Then we have to press OK.
In addition to the server-level permissions management system, there is a system for defining access to the database level. A login can be declared with a database or multiple databases as a database user. A specific Database Role is assigned to each user.

This can also be easily done:

1.	Click on the right button near “login”.
2.	Select the “Properties” option.
3.	Select the “User Mapping” page. Select the needed buttons.
4.	Press “OK”.
The following screenshots show the process of creation of different users. The first user is HumanResources from the AdventureWorks2014 database.

![Image 9](https://github.com/AnastasiaFAF172/SQL/raw/images/9.png)
![Image 10](https://github.com/AnastasiaFAF172/SQL/raw/images/10.png)

The second user can only read data in the “Sales” scheme. At the same time, the user is able to manage any object and content of this object in the AdventureWorksDW2014 database. The third user is able to create new databases and define access to them.

![Image 11](https://github.com/AnastasiaFAF172/SQL/raw/images/11.png)
![Image 12](https://github.com/AnastasiaFAF172/SQL/raw/images/12.png)
![Image 13](https://github.com/AnastasiaFAF172/SQL/raw/images/13.png)
![Image 14](https://github.com/AnastasiaFAF172/SQL/raw/images/14.png)

#### Conclusions:

1.	I learned how to install the SQL Server software.
2.	I accomplished server registration and server configuration.
3.	I got acquainted with the basic functions of the SQL Server 2014, such as creation of users.

