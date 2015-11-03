# Live PI Charts
Real-time voting app designed for Adler Planetarium events. Originally built for Pi Day 2014 (hence the name).

### Setup
Live Pi Charts (LPC) is a small Javascript app, using React as the framework and Firebase for data storage and real-time synchronization. You'll need Node to build and serve the app locally. To get started, simply clone the repo and `npm install`

### Firebase
Firebase makes it super simple to have the app respond in real-time to new votes. As soon as someone votes, the pie chart will automatically update to reflect the new totals. The Firebase account the app uses is under cs@zooniverse.org. Ask Camille for the credentials to make changes.

### Usage
Adjust the questions as desired in lib/questions.coffee. To adjust what questions you would like to appear, use a URL param, e.g. appurl.com?q=1,2 if you want only the first and second questions to appear. At the moment, the deploy script pushes the app to adler-staging.s3-website-us-east-1.amazonaws.com/live-pi-chart.
