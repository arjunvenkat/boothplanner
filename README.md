## Updating the code

The dropdown on the homepage for "Displaying courses available in <Season> <Year>" with the needs to be updated annually. The form can be found at `views/course_by_profs/index` on line 7. Only the season and year needs to change. 

## Updating the data files

All the data files are located in db/data. The three files are:

- course_evals.csv
- course_price_history.csv
- new_course_schedule.csv

Data for each file can be found through the Booth intranet. Course evals and the new course schedule can be found the course search tool while the course price history can be found through iBid.

`new_course_schedule.csv` is replaced completely, while new data is added to the end of `course_evals.csv` and `course_price_history.csv`, leaving existing data in place. Even though the database should preserve old course information, keeping a backup of the historical data in text form will ensure that anyone can recreate the database if it ever gets corrupted and we lose access to old files from Booth.

When you update each file, please check that the format of new data matches the old data. Sometimes the letter names of days or the format of professor names can change from year to year. If that's the case, you'll need to update code in `import.rake` so the new data formats are taken into account.

Once the files have been updated, test to make sure the import scripts work in development by running

```
rails import:new_course_schedule
rails import:sections
rails import:course_price_history

```

These commands directly imports data from the CSV files into database tables. Then you'll need to run

```
rails update:all
```

This command updates the presentation table of `coure_by_profs` using information from the updated base tables.

If everything looks ok, push to production and re-run the rake tasks in your production environment.
