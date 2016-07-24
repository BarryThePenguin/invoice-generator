Invoice

- currency : String
- client : Client
- services : List Service
- expenses : List Expense

Client

- name : String
- address : String
- city : String
- postcode : String
- country : String

Service

- title : String
- description : String
- amount : Float

Expense

- description : String
- amount : Float

Payment
- accountName : String
- accountNumber : String
- bsb : String

You
- name : String
- email : String
- address : String
- city : String
- postcode : String
- country : String

Reference:

[Modelling Money In Elm](https://thomascoopman.eu/blog/2016/04/12/modelling-money-in-elm/)
