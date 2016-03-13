rdb-fullstack
=============

# Swiss Tournament Project

by Andrew Sychra

### About

This project is an encapsulated virtual environment that runs python on top of a postgres database. 

### How to run

This directory can be initiated with [Vagrant](https://www.vagrantup.com/) by executing the command `vagrant up` within the `vagrant/` directory.  Pick the directory you wish to install and follow the following commands:


- `git clone http://github.com/udacity/fullstack-nanodegree-vm fullstack`
- `vagrant up`
- `vagrant ssh`
- `cd /vagrant/tournament`
- `psql`
- `CREATE DATABASE tournament;`
- `\c tournament;`
- `\i tournament.sql`
- `\q`
- `python tournament_test.py`

