# gambol-sinatra-project
This is a repository of my Flatiron School Sinatra project. It is a username/password login domain that allows users to create betting lists, populate them with various sportsbetting propositions (game winners, totals, etc.) and track them. A user can have many lists of props. A list belongs to a user and cannot be edited by other users.

Specifications for the Sinatra Assessment
Specs:
  x Use Sinatra to build the app
  x Include user accounts
  x  Use ActiveRecord for storing information in a database
  x Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
  x Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
  x Include more than one model class (list of model class names e.g. User, Post, Category)
      1. User
      2. BettingSlip
      3. Prop

   Ensure that users can't modify content created by other users
   Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

  x Include user input validations
   Display validation failures to user with error message (example form URL e.g. /posts/new)

   Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
   You have a large number of small Git commits
   Your commit messages are meaningful
   You made the changes in a commit that relate to the commit message
   You don't include changes in a commit that aren't related to the commit message
