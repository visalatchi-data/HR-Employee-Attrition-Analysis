-- Table: public.hr_attrition

-- DROP TABLE IF EXISTS public.hr_attrition;

CREATE TABLE IF NOT EXISTS public.hr_attrition
(
    age integer,
    attrition character varying(3) COLLATE pg_catalog."default",
    business_travel character varying(30) COLLATE pg_catalog."default",
    daily_rate integer,
    department character varying(50) COLLATE pg_catalog."default",
    distance_from_home integer,
    education integer,
    education_field character varying(50) COLLATE pg_catalog."default",
    employee_count integer,
    employee_number integer,
    environment_satisfaction integer,
    gender character varying(10) COLLATE pg_catalog."default",
    hourly_rate integer,
    job_involvement integer,
    job_level integer,
    job_role character varying(50) COLLATE pg_catalog."default",
    job_satisfaction integer,
    marital_status character varying(20) COLLATE pg_catalog."default",
    monthly_income integer,
    monthly_rate integer,
    num_companies_worked integer,
    over18 character(1) COLLATE pg_catalog."default",
    overtime character varying(3) COLLATE pg_catalog."default",
    percent_salary_hike integer,
    performance_rating integer,
    relationship_satisfaction integer,
    standard_hours integer,
    stock_option_level integer,
    total_working_years integer,
    training_times_last_year integer,
    work_life_balance integer,
    years_at_company integer,
    years_in_current_role integer,
    years_since_last_promotion integer,
    years_with_curr_manager integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.hr_attrition
    OWNER to postgres;
