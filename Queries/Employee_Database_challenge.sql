-- Deliverable 1
-- Create new table for retiring employees
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_tables
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, e.birth_date DESC;

-- Confirm correct table contents and configuration
SELECT * FROM retirement_tables;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_tables AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Confirm correct table contents and configuration
SELECT * FROM unique_titles;

-- Count the the totals for each unique title in unique_titles table
SELECT COUNT(ut.title) AS "count", 
ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY title
ORDER BY count DESC;

-- Confirm correct table contents and configuration
SELECT * FROM retiring_titles;


-- Deliverable 2
-- Create new table for employees eligible for mentorship program
SELECT DISTINCT ON(e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
    de.from_date,
    de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Confirm correct table contents and configuration
SELECT * FROM mentorship_eligibility;


-- Deliverable 3
-- Question 1:
-- Create Promotion eligibility list
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

-- Confirm correct table contents and configuration
SELECT * FROM promotion_eligibility;

-- Count of each position eligible for promotion
SELECT COUNT(pe.title) AS "count", 
pe.title
INTO promotion_titles
FROM promotion_eligibility AS pe
GROUP BY title
ORDER BY count DESC;

-- Confirm correct table contents and configuration
SELECT * FROM promotion_titles;

-- Determine the vacancy totals for each unique title after retire/promotion
-- Show list of retiring_titles
SELECT * FROM retiring_titles;

-- Question 2:
-- Count of mentorship eligible employees in each department by title
SELECT me.emp_no,
	me.title,
	d.dept_name,
	me.first_name,
	me.last_name
INTO mentorship_eligibility_by_dept
FROM mentorship_eligibility AS me
INNER JOIN dept_emp AS de
	ON (me.emp_no = de.emp_no)
INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
		
-- Confirm correct table contents and configuration
SELECT * FROM mentorship_eligibility_by_dept;

-- Count of mentorship by title by dept
SELECT COUNT(mebd.title) AS "count", 
mebd.title,
mebd.dept_name
INTO mentorship_dept_counts
FROM mentorship_eligibility_by_dept AS mebd
GROUP BY dept_name, title
ORDER BY dept_name, count DESC;

-- Confirm correct table contents and configuration
SELECT * FROM mentorship_dept_counts;
