CREATE TABLE administrative_staff (
    employee_id   CHAR(10) NOT NULL,
    title         VARCHAR2(30) NOT NULL
);

ALTER TABLE administrative_staff ADD CONSTRAINT administrative_staff_pk PRIMARY KEY ( employee_id );

CREATE TABLE diagnosis (
    visits_visit_id         CHAR(10) NOT NULL,
    medical_cd_medical_cd   CHAR(10) NOT NULL
);

CREATE UNIQUE INDEX diagnosis__idx ON
    diagnosis (
        medical_cd_medical_cd
    ASC );

CREATE TABLE drug_list (
    drug_id         CHAR(10) NOT NULL,
    drug_desc       VARCHAR2(200) NOT NULL,
    stock_on_hand   INTEGER NOT NULL,
    cost_per_unit   FLOAT(2) NOT NULL
);

ALTER TABLE drug_list ADD CONSTRAINT drug_list_pk PRIMARY KEY ( drug_id );

CREATE TABLE medical_cd (
    medical_cd     CHAR(10) NOT NULL,
    medical_desc   VARCHAR2(200) NOT NULL
);

ALTER TABLE medical_cd ADD CONSTRAINT medical_cd_pk PRIMARY KEY ( medical_cd );

CREATE TABLE nurses (
    employee_id     CHAR(10) NOT NULL,
    certification   VARCHAR2(30) NOT NULL
);

ALTER TABLE nurses ADD CONSTRAINT nurses_pk PRIMARY KEY ( employee_id );

CREATE TABLE patient (
    patient_id    CHAR(10) NOT NULL,
    first_name    VARCHAR2(30) NOT NULL,
    middle_name   VARCHAR2(30),
    last_name     VARCHAR2(30) NOT NULL,
    house_num     INTEGER NOT NULL,
    street_name   VARCHAR2(50) NOT NULL,
    unit_num      VARCHAR2(20),
    city          CHAR(20) NOT NULL,
    state         VARCHAR2(20) NOT NULL,
    zipcode       NUMBER NOT NULL,
    dob           DATE NOT NULL,
    tel           INTEGER NOT NULL
);

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( patient_id );

CREATE TABLE physicians (
    employee_id           CHAR(10) NOT NULL,
    certification         VARCHAR2(30) NOT NULL,
    other_certification   VARCHAR2(30),
    speciality            VARCHAR2(30) NOT NULL
);

ALTER TABLE physicians ADD CONSTRAINT physicians_pk PRIMARY KEY ( employee_id );

CREATE TABLE prescription (
    times_per_day       INTEGER NOT NULL,
    num_days            INTEGER NOT NULL,
    drug_list_drug_id   CHAR(10) NOT NULL,
    visits_visit_id     CHAR(10) NOT NULL,
    order_by            CHAR(10)
);

ALTER TABLE prescription ADD CONSTRAINT prescription_pk PRIMARY KEY ( visits_visit_id,
                                                                      drug_list_drug_id );

CREATE TABLE staff (
    employee_id   CHAR(10) NOT NULL,
    data_hired    DATE NOT NULL,
    first_name    VARCHAR2(20) NOT NULL,
    middle_name   VARCHAR2(20),
    last_name     VARCHAR2(20) NOT NULL
);

ALTER TABLE staff ADD CONSTRAINT staff_pk PRIMARY KEY ( employee_id );

CREATE TABLE technologists (
    employee_id     CHAR(10) NOT NULL,
    certification   VARCHAR2(30) NOT NULL,
    title           VARCHAR2(30) NOT NULL
);

ALTER TABLE technologists ADD CONSTRAINT technologists_pk PRIMARY KEY ( employee_id );

CREATE TABLE test_details (
    result                      VARCHAR2(20) NOT NULL,
    result_desc                 VARCHAR2(200),
    tests_test_cd_id            CHAR(10) NOT NULL,
    visits_visit_id             CHAR(10) NOT NULL,
    technologists_employee_id   CHAR(10) NOT NULL,
    order_by                    CHAR(10)
);

ALTER TABLE test_details ADD CONSTRAINT test_details_pk PRIMARY KEY ( technologists_employee_id,
                                                                      visits_visit_id );

CREATE TABLE tests (
    test_cd_id   CHAR(10) NOT NULL,
    test_desc    VARCHAR2(30) NOT NULL
);

ALTER TABLE tests ADD CONSTRAINT tests_pk PRIMARY KEY ( test_cd_id );

CREATE TABLE visit_details (
    visits_visit_id          CHAR(10) NOT NULL,
    nurses_employee_id       CHAR(10) NOT NULL,
    patient_patient_id       CHAR(10) NOT NULL,
    physicians_employee_id   CHAR(10),
    temperature              FLOAT(2) NOT NULL,
    weight                   FLOAT(2) NOT NULL,
    blood_pressure           VARCHAR2(10) NOT NULL,
    nurse_notes              VARCHAR2(200) NOT NULL,
    other_instructions       VARCHAR2(200)
);

ALTER TABLE visit_details ADD CONSTRAINT visit_details_pk PRIMARY KEY ( visits_visit_id );

CREATE TABLE visits (
    visit_id     CHAR(10) NOT NULL,
    visit_date   DATE
);

ALTER TABLE visits ADD CONSTRAINT visits_pk PRIMARY KEY ( visit_id );

ALTER TABLE administrative_staff
    ADD CONSTRAINT administrative_staff_staff_fk FOREIGN KEY ( employee_id )
        REFERENCES staff ( employee_id );

ALTER TABLE diagnosis
    ADD CONSTRAINT diagnosis_medical_cd_fk FOREIGN KEY ( medical_cd_medical_cd )
        REFERENCES medical_cd ( medical_cd );

ALTER TABLE diagnosis
    ADD CONSTRAINT diagnosis_visits_fk FOREIGN KEY ( visits_visit_id )
        REFERENCES visits ( visit_id );

ALTER TABLE nurses
    ADD CONSTRAINT nurses_staff_fk FOREIGN KEY ( employee_id )
        REFERENCES staff ( employee_id );

ALTER TABLE physicians
    ADD CONSTRAINT physicians_staff_fk FOREIGN KEY ( employee_id )
        REFERENCES staff ( employee_id );

ALTER TABLE prescription
    ADD CONSTRAINT prescription_drug_list_fk FOREIGN KEY ( drug_list_drug_id )
        REFERENCES drug_list ( drug_id );

ALTER TABLE prescription
    ADD CONSTRAINT prescription_visits_fk FOREIGN KEY ( visits_visit_id )
        REFERENCES visits ( visit_id );

ALTER TABLE technologists
    ADD CONSTRAINT technologists_staff_fk FOREIGN KEY ( employee_id )
        REFERENCES staff ( employee_id );

ALTER TABLE test_details
    ADD CONSTRAINT test_details_technologists_fk FOREIGN KEY ( technologists_employee_id )
        REFERENCES technologists ( employee_id );

ALTER TABLE test_details
    ADD CONSTRAINT test_details_tests_fk FOREIGN KEY ( tests_test_cd_id )
        REFERENCES tests ( test_cd_id );

ALTER TABLE test_details
    ADD CONSTRAINT test_details_visits_fk FOREIGN KEY ( visits_visit_id )
        REFERENCES visits ( visit_id );

ALTER TABLE visit_details
    ADD CONSTRAINT visit_details_nurses_fk FOREIGN KEY ( nurses_employee_id )
        REFERENCES nurses ( employee_id );

ALTER TABLE visit_details
    ADD CONSTRAINT visit_details_patient_fk FOREIGN KEY ( patient_patient_id )
        REFERENCES patient ( patient_id );

ALTER TABLE visit_details
    ADD CONSTRAINT visit_details_physicians_fk FOREIGN KEY ( physicians_employee_id )
        REFERENCES physicians ( employee_id );

ALTER TABLE visit_details
    ADD CONSTRAINT visit_details_visits_fk FOREIGN KEY ( visits_visit_id )
        REFERENCES visits ( visit_id );

ALTER TABLE administrative_staff
    ADD CONSTRAINT administrative_staff_staff_fk FOREIGN KEY ( employee_id )
        REFERENCES staff ( employee_id );

ALTER TABLE diagnosis
    ADD CONSTRAINT diagnosis_medical_cd_fk FOREIGN KEY ( medical_cd_medical_cd )
        REFERENCES medical_cd ( medical_cd );

ALTER TABLE diagnosis
    ADD CONSTRAINT diagnosis_visits_fk FOREIGN KEY ( visits_visit_id )
        REFERENCES visits ( visit_id );

ALTER TABLE nurses
    ADD CONSTRAINT nurses_staff_fk FOREIGN KEY ( employee_id )
        REFERENCES staff ( employee_id );

ALTER TABLE physicians
    ADD CONSTRAINT physicians_staff_fk FOREIGN KEY ( employee_id )
        REFERENCES staff ( employee_id );

ALTER TABLE prescription
    ADD CONSTRAINT prescription_drug_list_fk FOREIGN KEY ( drug_list_drug_id )
        REFERENCES drug_list ( drug_id );

ALTER TABLE prescription
    ADD CONSTRAINT prescription_visits_fk FOREIGN KEY ( visits_visit_id )
        REFERENCES visits ( visit_id );

ALTER TABLE technologists
    ADD CONSTRAINT technologists_staff_fk FOREIGN KEY ( employee_id )
        REFERENCES staff ( employee_id );

ALTER TABLE test_details
    ADD CONSTRAINT test_details_technologists_fk FOREIGN KEY ( technologists_employee_id )
        REFERENCES technologists ( employee_id );

ALTER TABLE test_details
    ADD CONSTRAINT test_details_tests_fk FOREIGN KEY ( tests_test_cd_id )
        REFERENCES tests ( test_cd_id );

ALTER TABLE test_details
    ADD CONSTRAINT test_details_visits_fk FOREIGN KEY ( visits_visit_id )
        REFERENCES visits ( visit_id );

ALTER TABLE visit_details
    ADD CONSTRAINT visit_details_nurses_fk FOREIGN KEY ( nurses_employee_id )
        REFERENCES nurses ( employee_id );

ALTER TABLE visit_details
    ADD CONSTRAINT visit_details_patient_fk FOREIGN KEY ( patient_patient_id )
        REFERENCES patient ( patient_id );

ALTER TABLE visit_details
    ADD CONSTRAINT visit_details_physicians_fk FOREIGN KEY ( physicians_employee_id )
        REFERENCES physicians ( employee_id );

ALTER TABLE visit_details
    ADD CONSTRAINT visit_details_visits_fk FOREIGN KEY ( visits_visit_id )
        REFERENCES visits ( visit_id );
