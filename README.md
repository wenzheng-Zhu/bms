# README

Ruby version: 2.6.3
Ruby on rails version: 6.1.3

Noted: 
1. This document is relatively rough.
2. I didn't write the testing codes because of the time, but i tested the apis using postman.
3. Maybe the controllers are so heavy, but they can be more fast i think.
4. I config the quantites of books that one user can borrow and the fees that one book was lent per day in the   /config/application.yml
5. I didn't write the CRUD of users, books. i just wrote the apis according to the test requirement.
6. The account will be created after the user is created automatically.
7. You can run rails db:seed in the terminal that mock the testing datas.
8. The relations between the tables, as follows:
  user has_one account
  account belongs_to user
  book has_many incomes
  income belongs_to book
  loan belongs_to account


The apis are as follows(examples):
1. a borrowing transaction with parameters for the user's ID and the book's ID
   post url: http://loacalhost:3000/api/v1/users/:id/borrowing?book_id=4
   parameters are: 
          id(user's id)
          book_id(book's id)

2. a returning transaction with parameters for the user's ID and the book's ID
   post url: http://loacalhost:3000/api/v1/users/:id/returning?book_id=4
   parameters are: 
          id(user's id)
          book_id(book's id)

3. Query the account status of a user, the parameter is the user ID, return the current     balance, and borrow the books.
   post http://localhost:3000/api/v1/users/:id/account_status
   parameters are: 
          id(user's id)

4. Query the actual income of a book, the parameter is the ID and time range of the book, and return the transaction amount obtained by the book during this time.
  post http://localhost:3000/api/v1/books/:id/incomes_checking
  parameters are: 
          id(user's id)
5. index of users:
   get http://localhost:3000/api/v1/users

6. index of books:
   get http://localhost:3000/api/v1/books

7. index of accounts:
   get http://localhost:3000/api/v1/accounts

8. index of loans:
   get http://localhost:3000/api/v1/loans