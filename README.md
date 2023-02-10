# README

This is a sample project utilising Trello's restful API to display a users boards, lists and cards and add new ones as well. It is built using ruby and rails with
stimulus JS

## SETUP

You need to get your own trello credentials. More specifically, your api key and
member token. After acquiring the keys kindly follow the instructions below:

<!-- - Delete the existing credentials.yml.enc as no master key to decrypt them will be provided. -->

- Add your keys to your newly created rails encryption file by running this command
  `EDITOR=nano rails credentials:edit` you can replace nano with VI or your preferred editor
- Add your keys in the following format
  `trello: application_key: 'your key here' member_token: 'your key here'`
- save and exit. This will create a new file under config folder called credentials.yml.enc
- make sure to wrap your keys in the single quotes('') as not doing so will result in an error. This small thing took me almost an hour to trace

## Running the app

## Prerequisites

- Ruby 2.7.2
- Rails 6.1.4

To run the app, first run `bundle install` then run `yarn install`
run `rails s` to start the rails server
run `bin/webpack-dev-server` for live reloading
Finally navigate to localhost:3000

If the credentials have been set right, you should see a grid of all your current trello boards. Click on any board to view its lists and cards.

## Improvements

- In terms of improvements, I would handle the calls to the api better. Maybe putting them in a service object instead of the controller.
- Improve on the credentials handling, I still feel there is a better way to handle them
- Maybe add flash messages to enhance the UI/UX
- Add the ability to add/edit/delete boards and lists too
- Improve on the file structure. Have multiple controllers, view folders etc, to future proof growth of the application
- Write some tests for both the Api and FE elements like deleting/updating cards
- In terms of design, maybe make the list name sticky at the top on scroll. May work well for lists with a lot of cards.
- Add a popup modal to show greater description on click instead of edit form and better placement of the close link
- I would have also versioned the API, makes things clean and future proof.
- Add pagination or lazyloading for boards/lists/cards
- This are all things I could do but I think may be a bit overkill considering the scope of the assignment and I have to get the react version ASAP.
