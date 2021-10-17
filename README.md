# Pewlett-Hackard-Analysis

## Overview of the analysis:

The purpose of this analysis was to:
- Determine a list of personnel that are eligible to retire.
- Determine a list of personnel that are eligible to participate in a mentorship program.
- Calculate the number of positions affected by the retiring personnel.
- Develop options for the future impact of the retiring personnel. 

## Table of contents:
* [Resources](#resources)
* [Results](#results)
* [Summary](#summary)

## Resources:
- PgAdmin 4
- provided .csv files of data.

## Results:

There is a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
### Analysis Finding 1: 
The company will experience a significant reduction in staffing due to retirement potential.  A full list of retirement eligible employees can be found here:
[retirement_titles.csv](https://github.com/nseddon/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv)

### Analysis Finding 2:
The company will have a total of 1549 employees that are eligible to participate in a mentorship program.  The full list of all employees can be found here:
[mentorship_eligibility.csv](https://github.com/nseddon/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibility.csv)

### Analysis Finding 3:
The company will have a total 90,398 employees fit the eligibility requirements for retirement.  These numbers are broken down by Title in the table displayed below.  The file may be accessed here: [retiring_titles.csv](https://github.com/nseddon/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv)

![retiring_titles](https://user-images.githubusercontent.com/89038310/137605246-5b84ccb6-7c73-43bd-98b4-3b0ffd7ad72a.png)

### Analysis Finding 4:
The company will have a significant loss of the workforce across all levels of employment.  Determination of positions that can be filled via promotions will be critical to ensure company productivity.  Additional query is recommended.

### Analysis Finding 5:
Employees eligible for promotion were determined using the following parameters:
- Employee is currently employed.
- Employee has been in their current position since January 1, 1998.
- Employee is currently in a position as an Engineer, Assistant Engineer, or Staff.
- Code for the query presented below.
```
SELECT DISTINCT ON(e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
    de.from_date,
    de.to_date,
	t.title
INTO promotion_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (de.from_date < '1998-01-01')
	AND (e.birth_date > '1955-12-31')
	AND (t.title = 'Engineer' OR t.title = 'Staff' OR t.title = 'Assistant Engineer')
ORDER BY e.emp_no;
```
### Analysis Finding 6:
The company will not have employees at every level, in every department eligible for the mentorship program.  A snippet of the data can be seen below, and the full file can be accessed here: [mentorship_dept_counts](https://github.com/nseddon/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_dept_counts.csv)
![mentorship_by_dept](https://user-images.githubusercontent.com/89038310/137605308-6ebf7679-4a75-411e-8be8-ac694e0e4e5a.png)
As can be seen, several departments do not have personnel in every staff level available to mentor new hired personnel.



![retiring_titles](https://user-images.githubusercontent.com/89038310/137605246-5b84ccb6-7c73-43bd-98b4-3b0ffd7ad72a.png)
![promotion_eligible](https://user-images.githubusercontent.com/89038310/137605280-4d5fa61a-f6bf-4d6d-9732-f0da01202373.png)


https://github.com/nseddon/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_dept_counts.csv

## Summary:

The summary addresses the two questions and contains two additional queries or tables that may provide more insight.

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
