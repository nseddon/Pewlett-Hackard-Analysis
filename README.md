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
The results of the above query are presented below, and the file can be accessed here: [promotion_titles.csv](https://github.com/nseddon/Pewlett-Hackard-Analysis/blob/main/Data/promotion_titles.csv)
![promotion_eligible](https://user-images.githubusercontent.com/89038310/137605280-4d5fa61a-f6bf-4d6d-9732-f0da01202373.png)


### Analysis Finding 6:
The company will not have employees at every level, in every department eligible for the mentorship program.  A snippet of the data can be seen below, and the full file can be accessed here: [mentorship_dept_counts.csv](https://github.com/nseddon/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_dept_counts.csv)
![mentorship_by_dept](https://user-images.githubusercontent.com/89038310/137605308-6ebf7679-4a75-411e-8be8-ac694e0e4e5a.png)

As can be seen, several departments do not have personnel in every staff level available to mentor new hired personnel.  The company may need to seek qualified candidates for positions that can quickly become versed in business practices, in order to then provide mentorship to additional new personnel.

## Summary:
The analysis has determined:
- The company has 90,398 employees who are eligible to retire.
- Breakdown of roles that will need to be filled, either through hiring or promotion are as follow:
![retiring_titles](https://user-images.githubusercontent.com/89038310/137605246-5b84ccb6-7c73-43bd-98b4-3b0ffd7ad72a.png)
- The company has 1,549 employees that qualify to participate in a mentorship program.
- The company does not have enough employees qualified for mentorship to successfully train the next generation.  Additional hiring of skilled personnel will be critical to ensure performance levels.  Snippet of mentorship by position by department shown below.
![mentorship_by_dept](https://user-images.githubusercontent.com/89038310/137605308-6ebf7679-4a75-411e-8be8-ac694e0e4e5a.png)
- The company, with the listed promotion requirements from Finding 5, will have the following vacancies by title:
    - Senior Engineer: 0 vacancies (can be filled by promotable Engineers)
    - Senior Staff: 0 vacancies (can be filled by promotable Staff)
    - Manager: 0 vacancies (can be filled by promotable Staff)
    - Technique Leader: 0 vacancies (can be filled by promotable Staff)
    - Engineer: 39411 vacancies (after attrition and promotions)
    - Assistant Engineer: 5986 vacancies (after attrition and promotions)
    - Staff: 45001 vacancies (after attrition and promotions)
- It is recommended that additional parameters be considered to determine personnel eligible for the mentorship program, after promotions occur.  This may reduce the need for hiring of external candidates for senior positions, allowing more promotion from within where possible.
