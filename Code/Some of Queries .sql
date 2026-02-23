--1 Show all employees and the name of the department they work in
SELECT E.Name AS EmployeeName, D.Dname AS DepartmentName
FROM Employee E
JOIN Department D ON E.Dnum = D.Dnum;






--2 Display the employees working on a specific project with the number of hours
SELECT E.Name, P.Pname, W.Hours
FROM Employee E
JOIN Works_On W ON E.SSN = W.SSN
JOIN Project P ON W.Pnum = P.Pnum
WHERE P.Pname = 'ProjectX';





--3 Number of employees in each department
SELECT D.Dname, COUNT(E.SSN) AS NumberOfEmployees
FROM Department D
LEFT JOIN Employee E ON D.Dnum = E.Dnum
GROUP BY D.Dname;




--4 Employees who do not have a Supervisor (Top Managers)
SELECT Name, SSN
FROM Employee
WHERE SupervisorSSN IS NULL;






--5 Show all projects in a specific city, for example "Cairo"
SELECT Pname, City
FROM Project
WHERE City = 'Cairo';





--6 Display employees and the name of each employee's supervisor
SELECT E.Name AS EmployeeName, S.Name AS SupervisorName
FROM Employee E
LEFT JOIN Employee S ON E.SupervisorSSN = S.SSN;




--7  Display the names of employees and their dependents
SELECT E.Name AS EmployeeName, D.Dname AS DependentName
FROM Employee E
JOIN Dependent D ON E.SSN = D.SSN;





--8 Calculating average working hours per employee across projects   
SELECT E.Name, AVG(W.Hours) AS AvgHours
FROM Employee E
JOIN Works_On W ON E.SSN = W.SSN
GROUP BY E.Name;
