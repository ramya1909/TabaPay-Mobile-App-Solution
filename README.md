
Mobile Engineer - Security Question - SOLUTION 
Requirements of the App
Fetch the Data
URL used for grabbing data of Log Entries: https://demos.sandbox.tabapay.net/small.txt  
App Screens – Below is the video of the mobile app solution implemented, please click “Play” on the below video

https://github.com/ramya1909/TabaPay-Mobile-App-Solution/assets/144860251/5b78b9d6-6f21-4af2-b99e-8e907e8d10dc



1. Launch Screen
   
   ![Simulator Screenshot - iPhone SE (3rd generation) - 2024-04-16 at 17 15 04](https://github.com/ramya1909/TabaPay-Mobile-App-Solution/assets/144860251/6c2f6739-f9f7-47ac-906a-d4114b731902)


2. Home Page - HomePageViewController
Title: “TabaPay Security Logs”. 
Create a button that allows a user to enter the site.

Please find the UI of the screen below attached


![Simulator Screenshot - iPhone SE (3rd generation) - 2024-04-16 at 17 05 14](https://github.com/ramya1909/TabaPay-Mobile-App-Solution/assets/144860251/dbb469fc-c1c7-41da-955d-05745a8caa3b)
	For implementing the above UI screen, I created HomePageViewController and added a UILabel with Title as “TabaPay Security Logs” and UIButton with title as “Enter”
	Given backgroundColor and TitleColors for the button and label.


3. Building Logs - BuildingLogsViewController
Show the Building Logs in a nice format (you decide how to display. pagination will likely be needed). Something like

![Simulator Screenshot - iPhone SE (3rd generation) - 2024-04-16 at 17 05 18](https://github.com/ramya1909/TabaPay-Mobile-App-Solution/assets/144860251/3731bf16-eb8f-429c-9796-04f4c7d11434)

	For the above screen I created a Title Label with “Building Logs” and a back button to navigate to the previous screen.
	I fetched the data from the API using URLSession
	After receiving the API data parsed the logs string.
	Lastly populated the log entries into a ListView each item containing
1.	DateTime
2.	Employee Number
3.	Building Name
4.	Room Number





4. Employee Data-  EmployeeViewController
You should be able to click on each employee number. A modal dialogue box will pop up and all the log entries for that specific employee should be 
![Simulator Screenshot - iPhone SE (3rd generation) - 2024-04-16 at 17 05 22](https://github.com/ramya1909/TabaPay-Mobile-App-Solution/assets/144860251/bad73efe-3f11-48b1-aeb9-12591c92e772)


	For the above screen I opened a modal dialogue box when an item is selected in the BuildingLogsViewController.
	All the entries relating a specific Employee Number are populated in the above module dialog box
	All the entries are listed using a ListView in Swift iOS.



