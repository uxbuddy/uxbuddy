# UXBuddy

[UXBuddy](https://uxbuddy.herokuapp.com/) makes early stage testing for website designs a breeze. Just submit live website URL or an HTML file hosted on a public Github repository, select your questions, and share the survey link with your test-takers, and watch your results update.

## Development Setup

### Installation Prerequisites

First, you will need to install [Homebrew](http://brew.sh/).

Once installed, you can run the following via the Homebrew package manager in the command line.

Ruby

	$ brew install ruby

PostgreSQL

	$ brew install postgres

ImageMagick

	$ brew install imagemagick

PhantomJS

	$ brew install phantomjs

Bundler

	$ gem install bundler

### Run the app

Clone the repository on GitHub:

	$ git clone git@github.com:uxbuddy/uxbuddy.git

Enter your new project folder:

	$ cd uxbuddy

Create a .env file by copying from the example template and updating with your own secret SendGrid and AWS keys:

	$ cp .env.example .env

Install all the dependencies from the Gemfile using Bundler:

	$ bundle install

Create the necessary UXBuddy databases, run the migrations and seed with data:

	$ rails db:create db:migrate db:seed

Run the Rails server:

	$ rails s

### Running Tests

Run tests through RSpec.

	$ rspec

## Using UXBuddy

### Sign up

![Sign up](http://i.imgur.com/kCJtiYCl.png)

### Create tests

![Creating tests](http://i.imgur.com/lWK5ylol.png)

### Share tests

![Sharing](http://i.imgur.com/7xDu7kSl.png)

### Complete surveys
![Survey Part One](http://i.imgur.com/UPSvyZvl.png)

![Survey Part Two](http://i.imgur.com/G5W0fxtl.png)

### View results

![Results](http://i.imgur.com/gf9BeQkl.png)

## Contributions

To contribute to this project, please fork this repo and make a pull request with changes.

## Project Owners

[Abigail McPhillips](https://github.com/abigailmcp/) | [Laura Wilson](https://github.com/lsewilson/) | [Matthew Perkins](https://github.com/mfperkins/) | [Murtaza Abidi](https://github.com/mrmurtz/) | [Rosie Allott](https://github.com/rosieallott/) | [Tim Tang](https://github.com/tim3tang/)
