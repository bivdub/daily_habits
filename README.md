# daily_habits

The Daily Habit is an application that aims to help users create, set and keep goals. Users of The Daily Habit lean on our app to provide real-time statistics, updates and daily notifications to help them stay on track with a new goal!

http://thedailyhabit.herokuapp.com

----------------------------------------
Contributors:

Annie McGhee: https://github.com/anniemcghee
Brian Van Winkle: https://github.com/bivdub
Sanda Htyte: https://github.com/bksanda

----------------------------------------
User Story:

When a user wants to implement a new daily habit, they sign up for The Daily Habit using our authorization system or by signing up with Facebook.

Upon sign up, the user will be directed to their profile and prompted to add new goals.

A user can select from genre lists of goals created by The Daily Habit - or they can create a custom goal. Users can set as few or as many goals as they like - but every goal's progress will be tracked by The Daily Habit!

In order to assist with remembering to complete their goals, any user can opt-in to text notifications. The Daily Habit will notify you every day if you have yet to complete goals.

Users can also add an "accountability email" - someone that is emailed when they don't achieve some of their goals!

Every day, the user is responsible for checking the goal off their to-do list - "Done!". The Daily Habit works behind the scenes to track users' success rates, streaks of days completed and many more statistics about individual users and our community of users.

As a user progresses with their goals, The Daily Habit has a badge award system that awards users for a multitude of achievements. Motivating factors like badges, texts, accountability emails and statistics are a recipe for user success.

----------------------------------------
Wireframes:

Our original wireframes were created in UXPin-
http://live.uxpin.com/27102740dd6e4339136294305026cdd155434317#/pages/15452203

-----------------------------------------
Models:

User - used for authorization
GoalsUser - Links many users to many goals and includes statistics related to goals and users
Goals - Lists all goals, their type (including "User" for custom goals) and includes statistics for the community of users of each goal
Awards - Lists all awards and includes badge images and ids

-----------------------------------------
APIs, Addons and Gems Used:

Twilio
Sendgrid
Morris Charts
Rafael.js
Heroku Scheduler
BCrypt
Facebook OmniAuth

-------------------------------------------
Scope/MVP:

We were successful in meeting our deliverables on time to achieve MVP for The Daily Habit.

-Create a functional app that tracks and resets unique user statistics daily.
-Use Active Record to traverse large amoutns of data and options for users.
-Enable OmniAuth and opt-in for text or email notifications from our app.
-Create an award system that responds to user interaction with the app.
-Compare user statistics to community statistics for each goal.

-------------------------------------------
Wishlist:

-Make the awards system more robust. At this point, it's more as a "Proof of Concept" stage and has lots of room to evolve.

-Have a larger dataset to work with regarding statistics. Because this app resets on a daily basis, we did not have much user/community data to present and use. A larger dataset would help inform what data would be interesting and more dynamic for our users.

-Rework the model system to be more concise and take all stat-tracking out of GoalsUsers.

-Add a password reset function to our user update.

-Customize emails and texts for each user based on goals.

-Include more dynamic animation and styling.

-Utilize more mobile responsive tools like modals, etc.


