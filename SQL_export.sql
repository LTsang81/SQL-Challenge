--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1.pgdg90+1)
-- Dumped by pg_dump version 11.3

-- Started on 2019-10-11 01:56:24 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16769)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying NOT NULL,
    dept_name character varying(65) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16785)
-- Name: dept_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_employee (
    employee_no integer NOT NULL,
    dept_no character varying NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.dept_employee OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16777)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    gender character varying,
    hire_date date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16900)
-- Name: managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.managers (
    dept_no character varying NOT NULL,
    employee_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.managers OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16817)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    employee_no integer NOT NULL,
    salary integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16825)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    employee_no integer NOT NULL,
    title character varying NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 2764 (class 2606 OID 16776)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);


--
-- TOC entry 2766 (class 2606 OID 16784)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_no);


--
-- TOC entry 2768 (class 2606 OID 16796)
-- Name: dept_employee dept_employee_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_employee
    ADD CONSTRAINT dept_employee_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 2767 (class 2606 OID 16791)
-- Name: dept_employee dept_employee_employee_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_employee
    ADD CONSTRAINT dept_employee_employee_no_fkey FOREIGN KEY (employee_no) REFERENCES public.employees(employee_no);


--
-- TOC entry 2771 (class 2606 OID 16906)
-- Name: managers managers_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 2772 (class 2606 OID 16911)
-- Name: managers managers_employee_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_employee_no_fkey FOREIGN KEY (employee_no) REFERENCES public.employees(employee_no);


--
-- TOC entry 2769 (class 2606 OID 16820)
-- Name: salaries salaries_employee_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_employee_no_fkey FOREIGN KEY (employee_no) REFERENCES public.employees(employee_no);


--
-- TOC entry 2770 (class 2606 OID 16831)
-- Name: titles titles_employee_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_employee_no_fkey FOREIGN KEY (employee_no) REFERENCES public.employees(employee_no);


-- Completed on 2019-10-11 01:56:24 UTC

--
-- PostgreSQL database dump complete
--