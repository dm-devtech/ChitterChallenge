#### Chitter Challenge
Twitter clone

##### Instructions
- Bundle install
- Set up databases as per the instructions in the ./db/migrations readme

```Getting started:

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE chitter;`
3. Connect to the database using the `pqsl` command `\c chitter;`
4. Run the query we have saved in the file `01_create_chitter_table.sql` to create the table required to run the live app

Setting up test databases:

1. Connect to `psql`
2. Create the test database using the `psql` command `CREATE DATABASE chitter_test;`
3. Connect to the database using the `pqsl` command `\c chitter_test;`
4. Run the commands in the file `02_create_chitter_table` to create the table required for testing.  
```

###### To post a peep
- run the terminal command `rackup`
- Go to the address localhost:9292/peeps/new
- To post a peep enter peep text and enter the time as `NOW()`

To run tests
- Make sure the test database is set up
- run `rspec` in the temrinal

##### Tech used
- Ruby
- PostgreSQL

##### Testing
- Capybara
- Rspec

##### Test coverage
COVERAGE:  94.67% -- 71/75 lines in 3 files

+----------+-----------------------------------+-------+--------+---------+
| coverage | file                              | lines | missed | missing |
+----------+-----------------------------------+-------+--------+---------+
|  90.91%  | spec/unit/peep_unit_spec.rb       | 22    | 2      | 16-17   |
|  94.87%  | spec/features/App_feature_spec.rb | 39    | 2      | 51-52   |
+----------+-----------------------------------+-------+--------+---------+
1 file(s) with 100% coverage not shown
SimpleCov failed with exit 1

##### User stories
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

##### Original challenge
- [Link to challenge](https://github.com/makersacademy/chitter-challenge)
