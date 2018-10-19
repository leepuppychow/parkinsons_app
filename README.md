# README

## PROJECT DESCRIPTION
This is an ongoing personal project where I have been building an application for people with Parkinson's disease to help organize appointments, medications, and care providers. There are also tools for patients to search for new doctors using the BetterDoctor API and for PubMed journal articles (E-utilities API suite).

Moving forward I intend to create an interface for physical therapists as users. It will have tools such as appointment reminders and a fall risk prediction tool. For this, I have been building a Flask API that can perform fall risk predictions using a logistic regression classification model trained with scikit-learn.

* Note: this project is currently under construction.

## DEPLOYMENT INSTRUCTIONS
  * https://parkinsons.herokuapp.com/
  * To login as a patient user: username = leeuser & password = password
  * To login as a provider user: username = yimenguser & password = password

## DEVELOPER:
  * Lee Chow

## INSTRUCTORS:
  * Ilana Corson
  * Ali Schlereth
  * Sal Espinosa

## RUBY VERSION:
  * Rails 5.1.4
  * Ruby 2.4.1

## TESTING SUITE
  * RSpec with Capybara gem
  * FactoryBot gem
  * Launchy gem

## DATABASE SCHEMA
  ![alt text](/app/assets/images/parkinsons_schema.png)

## HOW TO RUN TEST SUITE
  * git clone repository
  * run 'rspec' in terminal
