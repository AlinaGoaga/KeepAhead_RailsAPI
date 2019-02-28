[![Build Status](https://travis-ci.com/AlinaGoaga/KeepAhead_SocialProject_Rails.svg?branch=master)](https://travis-ci.com/AlinaGoaga/KeepAhead_SocialProject_Rails)

# Keep Ahead

## Description
An app designed to aid the homeless by enabling the ability to donate a voucher of any given amount, to a venue that has signed up with the app.

## User Stories
```
As a User
So I can give food and drink to those in need
I want to send a donation to a venue

As a User
So I know what venues are participating
I would like a list of venues displayed

As a User
So I am aware of local Venues
I would like to see venues displayed by distance

As a User
So my donation gets to the right person
I would like to attach a name and passphrase to the donation

As a Venue
So that I can participate
I want to be able to register

As a Venue
So that I can access my account
I want to be able to login

As a venue
So I am aware of new Donations
I would like to be notified when a new donation is made

As a Venue
So that I can match a recipient to their donation
I would like to have a list of all donations




```


## Technologies Used
- Ruby on Rails
- RSpec
- Rubocop - Ruby linter
- simplecov
- Travis

## Installation
- Clone/Download this repo.
1. clone the repo<br/>
Under the repo name click *clone or download*<br/>
Click on *use HTTPs*, copy the clone URL of the repo<br/>
In the terminal go on the working directory where you want to clone the project<br/>
Use the `git clone` command and paste the clone URL then press enter :

```shell
$ git clone
```

2. On your local machine go inside of the *SocialProject_Rails* directory :

```shell
$ cd SocialProject_Rails
```
3. To install all the *gems* contained in the *Gemfile*, install and run *Bundle* :
Install :

```shell
$ install bundle
```
Run:

```shell
$ bundle
```
4. You can see the different directories, with the `ls` command.

## Run the tests

1. Check that the codes are passing the test. From the root *SocialProject_Rails* directory, run the *spec*.<br/>
You can check all the files in one go:

```shell
$ cd SocialProject_Rails
$ rspec
```
To check only one file at a time :

```shell
$ cd SocialProject_Rails
$ rspec spec/file_name_spec.rb
```

2. Check that the code respects the quality of the *Rubocop* guideline, by running `rubocop` from the *SocialProject_Rails* directory :

```shell
$ cd SocialProject_Rails
$ rubocop
```

## Minimum Viable Product(MVP)
The MVP for this project is to have a donation that is made in the front end, appear in the back end database.

## Approach

We had a team of 3 working on this side of the project, and a team of 3 working towards developing
the front end using React.

We were following a TDD approach, in which we would write tests for code, before writing the code itself. This ensured that the tests could help design the code, and also keep everything functioning well.

## Controllers, models and their responsibilities

- Donations Controller - It contains methods for displaying a venue and any associated donations. Also a method for creating a new donation which is allocated to that venue

- Donation class - Instances of the donation class have an amount, passphrase and associated venue ID.

- Venues Controller - It contains methods for displaying a list of all venues, and also a single venue.

- Venue class - Instances of the venue class have a name and address. There is a one to many relationship between venues and donations.
