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