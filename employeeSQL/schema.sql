-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "emp_num" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birthdate" varchar   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" varchar   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "salaries" (
    "emp_num" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "dep_manager" (
    "dep_num" varchar   NOT NULL,
    "emp_num" int   NOT NULL,
    CONSTRAINT "pk_dep_manager" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "dep_employee" (
    "emp_num" int   NOT NULL,
    "dep_num" varchar   NOT NULL,
    CONSTRAINT "pk_dep_employee" PRIMARY KEY (
        "emp_num","dep_num"
     )
);

CREATE TABLE "departments" (
    "dep_num" varchar   NOT NULL,
    "dep_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dep_num"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

ALTER TABLE "dep_manager" ADD CONSTRAINT "fk_dep_manager_dep_num" FOREIGN KEY("dep_num")
REFERENCES "departments" ("dep_num");

ALTER TABLE "dep_manager" ADD CONSTRAINT "fk_dep_manager_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

ALTER TABLE "dep_employee" ADD CONSTRAINT "fk_dep_employee_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

ALTER TABLE "dep_employee" ADD CONSTRAINT "fk_dep_employee_dep_num" FOREIGN KEY("dep_num")
REFERENCES "departments" ("dep_num");