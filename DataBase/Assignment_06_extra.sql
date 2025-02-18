DROP DATABASE IF EXISTS assignment_06_extra;
CREATE DATABASE assignment_06_extra;
USE assignment_06_extra;

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(
	EmployeeID					INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeLastName			VARCHAR(50),
    EmployeeFisrtName			VARCHAR(50),
    EmployeeHireDate			DATE DEFAULT (CURRENT_DATE),
    EmployeeStatus				VARCHAR(50),
    SupervisorID				INT,
    SocialSecurityNumber		INT
);

DROP TABLE IF EXISTS Project;
CREATE TABLE Project(
	ProjectID					INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID					INT,
    ProjectName					VARCHAR(250),
    ProjectStartDate			DATETIME,
    ProjectDecription			VARCHAR(250),
    ProjectDefault				VARCHAR(250),
    ProjectCompletedOn			DATE DEFAULT(CURRENT_DATE)
-- 	FOREIGN KEY (EmployeeID)
--         REFERENCES Employee (EmployeeID)
-- 	ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Project_Modules;
CREATE TABLE Project_Modules(
	ModuleID					INT PRIMARY KEY AUTO_INCREMENT,
    ProjectID					INT,
    EmployeeID					INT,
    ProjectModuleDate			DATE DEFAULT (CURRENT_DATE),
    ProjectModuleCompletedOn	DATE DEFAULT (CURRENT_DATE),
    ProjectModuleDescription	VARCHAR(250),
	FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID)
	ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ProjectID)
		REFERENCES Project(ProjectID)
	ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Work_Done;
CREATE TABLE Work_Done(
	WorkDoneID					INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID					INT,
    ModuleID					INT,
    WorkDoneDate				DATE DEFAULT (NULL),
    WorkDoneDecription			VARCHAR(250),
    WorkDoneStatus				VARCHAR(50),
	FOREIGN KEY (EmployeeID)
        REFERENCES Employee (EmployeeID)
	ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(ModuleID)
		REFERENCES Project_Modules (ModuleID)
	ON UPDATE CASCADE ON DELETE CASCADE
);