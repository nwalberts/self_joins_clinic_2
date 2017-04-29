# Custom Joins in ActiveRecord

```
git clone https://github.com/justinhuynh/self_joins_clinic.git
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

```
monster = User.find_by(name: "Monster")
monster.employees
monster.manager
```

### Multiple Custom Joins (Direct/Through Join Table)

```
gilly = User.find_by(name: "Gilly T. Dog")
gilly.items_for_sale
gilly.items_as_broker
monster.items_as_broker
Item.last.buyers
```

Take a look in `app/models` to see how the ActiveRecord associations were defined.
