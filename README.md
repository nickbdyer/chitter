#Chitter 

[![Code Climate](https://codeclimate.com/github/nickbdyer/chitter/badges/gpa.svg)](https://codeclimate.com/github/nickbdyer/chitter)

Week 4 Challenge at Makers Academy

###Challenge

Write a Twitter clone, allowing users to post to a public stream.

###Feature List

- [x] In order to use chitter as a maker I want to sign up to the service
- [x] In order to user chitter as a maker I want to log in
- [x] In order to avoid others to use my account as a maker I want to log out
- [x] In order to let people know what I am doing as a maker I want to post a message to chitter
- [x] In order to see what people have to say as a maker I want to see all peeps in chronological order

###Requirements

- [x] Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
- [x] The username and email are unique.
- [x] Peeps (posts to chitter) have the name of the maker and their user handle.
- [x] Use bcrypt to secure the passwords.
- [x] Use data mapper and postgres to save the data.
- [x] You don't have to be logged in to see the peeps.
- [x] You only can peep if you are logged in.

###Method

Given the size of this project, I intend to approach it in small steps lead by cucumber tests on the user interface. Although similar to the bookmark manager project, since that project was not UI lead, I think this will be benefical to my learning. 

###Images

![alt text](images/chitter.png
"Chitter")

###Improvements

I am resonably happy with the very simple CSS. The app is functional, and the
UX experience is not bad. 

Functionally, the app completes the brief set, however, I would like to
refactor some of the code, and add some more tests before developing further.

The controllers for example are far too long. 
