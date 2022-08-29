# README

This is a sample project utilising Trello's restful API to display a users boards, lists and cards and add new ones as well. It is built using ruby and rails with
stimulus js

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

To run the app, first run `bundle install` then run `yarn install`
Finally run `rails s` and navigate to localhost:3000

If the credentials have been set right, you should see a grid of all your current trello boards. Click on any board to view its lists and cards.

## Project Timeline

I spent a total of about 4 hours in a span of 2 days.

30min for initial setup. Creating the rails app, adding and setting up yarn dependencies like bootstrap and stimulus

1hour looking at the docs, I had initially setup the project using Ruby-trello gem but later on scrapped it in favour of the rest API. I figured this is probably what is being tested in this assignment anyway.

40 mins debugging the credentials issue. I had already set up my credentials which were working fine with the gem, I could call and get my board and lists. However when I switched to the rest api I kept getting an invalid token. I searched for a solution and initially thought the token was indeed incorrect but after almost an hour(I did take like a 15min break) of trial and error, I figured the issue

I did the next parts the following day. About 45min displaying the boards in the index page and lists and cards in the single board. Majority of this time was spent back in the docs trying to figure out how I can call a specific board and return all it's lists with cards of each list

I spent about 1hr writing the css(I had already installed bootstrap) and organising the layout. And adding the stimulus input for creating a new card, deleting and editing, plus toggling the forms and loading gif buttons.

## Improvements

- In terms of improvements, I would handle the calls to the api better. Maybe putting them in a service object instead of the controller.
- Improve on the credentials handling, I still feel there is a better way to handle them
- Maybe add flash messages to enhance the UI/UX
- Add the ability to add/edit/delete boards and lists too
- Improve on the file structure. Have multiple controllers, view folders etc, to future proof growth of the application
- Write some tests for both the Api and FE elements like deleting/updating cards
- In terms of design, maybe make the list name sticky at the top on scroll. May work well for lists with a lot of cards.
- Add a popup modal to show greater description on click instead of edit form and better placement of the close link
- This are all things I could do but I think may be a bit overkill considering the scope of the assignment and I have to get the react version ASAP.

---

I apologise for the delays, I will admit my React Js skills are not as proficient as I would love them to be especially compared to my rails skills. I do however have knowledge on the subject. I have created multiple components before but have not handled react router in practice. I will still submit my react app version of this I just need to do it in a single seating so I can research effectively if need be. I'm hoping to do this this weekend. It may also take me a bit longer to accomplish but nonetheless I shall accomplish the task and include some extras. Thank you and apologies once more.

Thank you for taking your time to review this. It was interesting and I loved it. I experimented with a couple of things especially with stimulus js. Instead of the normal js.erb + JQuery files to handle my ajax. I considered using rails 7 with turbo but I've not had a chance to use it yet, just read about it and I thought it might be too bold of me to write this in rails 7 for the first time in a job application. But soon. I'd appreciate and all feedback. Thanks again
