This is a reskinned version of a wonderful clinic that Justin Huynh put together. Much of the credit is his, and his original app can be found here https://github.com/justinhuynh/self_joins_clinic

# Custom Joins in ActiveRecord

```
git clone https://github.com/nwalberts/self_joins_clinic_2
bundle
```

Rename the `config/database.example.yml` and check to see that the database names work for you.

```
rake db:create
rake db:migrate
rake db:seed
```

Check out `db/seeds.rb` and `db/schema.rb` to see what the tables actually look like.

Then run `rails c` to check out the associations in the console.


### Self Joins

You'll see that, because of:
```ruby
  # User.rb
  has_many :employees, class_name: "User", foreign_key: "manager_id"
  belongs_to :manager, class_name: "User"
```

A manager has many employees, and an employee belongs to a manager. We'll also see a column for manager_id. Those employees that have been assigned a manager will have a value in their manager_id column.

Test your code with:
```
michael = User.find_by(name: "Michael")
michael.employees
michael.manager
```

Since the foreign key exists on a row for both a manager and employee, a manager can also have of their own as well!

### Multiple Custom Joins (Direct/Through Join Table)

Imagine these same company employees want to sell some items to one another.
Imagine also that some of them don't have the time to go around asking if someone wants
to buy a creepy clown portrait or a bag of beets. So other employees offer to *broker*
the selling for them, becoming middlemen/women.

We will have users that are sellers, brokers and buyers. We'll always want to track instances of multiple purchases of the same item, say if Jim and Kelly want to purchase Dwight's beets multiple times. In this way, a user can have many items, and an item can have many buyers. This is quite the a challenge to coordinate!

The code in this repo will help you configure your setup. Note each of the relationships between each of the models. Think about what the foreign key is going to be each time. The setup you need for your project might be different, so keep that in mind!

Test your code with:

```
gilly = User.find_by(name: "Gilly T. Dog")
gilly.items_for_sale
gilly.items_as_broker
monster.items_as_broker
Item.last.buyers
```

Take a look in `app/models` to see how the ActiveRecord associations were defined.
