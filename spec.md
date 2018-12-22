# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Using Sinitra gem
- [x] Use ActiveRecord for storing information in a database - using ActiveRecord
- [x] Include more than one model class (e.g. User, Post, Category) - Users and Wishlist
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - Users has_many Wishlists
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - WIshlist belongs to User
- [x] Include user accounts with unique login attribute (username or email) - user signs in with username, the same username cannot be used to create two Users
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Users can create, read, edit and delete their wishlists
- [x] Ensure that users can't modify content created by other users - user can only modify their own content
- [x] Include user input validations - email must contain "@ " symbol and username must be unique
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
