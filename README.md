# IATI-export-API

Following are the urls for APIs for different tables
The data is rendered in XML format.

api/activities
api/participating_organisations
api/sectors
api/budgets
api/transactions
api/planned_transactions
api/documents_links

The 'test.sql' file contains the schema of the table.
use 'psql' function to restore.

All the dependencies are present in the requirements.txt file. Install the dependecies using "pip install -r requirements.txt". Run the project using "runserver" command and test the api using POSTMAN or any other tool.

To see URL in XML format just type the URL in browser.
E.g. https://localhost:8000/api/activities
