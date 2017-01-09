# README
This README would normally document whatever steps are necessary to get the
application up and running. But we're lazy.
```ruby
rails g resource Company name
	has_many :locations
	has_many :users, through: :locations

rails g resource Location name address company_id:integer
  	belongs_to :company
  	has_many :users

rails g resource Car make model year:integer color user_id:integer
    belongs_to :user

rails g resource User email password_digest admin:boolean
    belongs_to :location
    has_many :drivers
    has_many :puddles, through: :drivers
    has_many :passengers
    has_many :puddles, through: :passengers
    has_many :profiles

rails g resource Profile name address phone:integer
    belongs_to :user

rails g resource Driver user_id:integer
	belongs_to :user
	has_many :puddles

rails g resource Passenger user_id:integer
	belongs_to :user
	has_many :puddle_passengers
	has_many :puddles, through: :puddle_passengers

rails g model PuddlePassenger puddle_id:integer passenger_id:integer
	belongs_to :passenger
	belongs_to :puddle

rails g resource Puddle departure_time:datetime seats:integer distance:float
	belongs_to :driver
	has_many :puddle_passengers
	has_many :passengers, through: :puddle_passengers

  ```
