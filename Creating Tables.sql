DROP TABLE members;
DROP TABLE committees;
DROP TABLE members_committees;


CREATE TABLE members
(
uteid        VARCHAR(20)   PRIMARY KEY,
first_name   VARCHAR(30),
last_name    VARCHAR(40),
email        VARCHAR(40),
phone        VARCHAR(12),
grade        NUMBER(1),
birthdate    DATE
);

CREATE TABLE committees
(
committee_id    NUMBER(5)   PRIMARY KEY,
committee_name  VARCHAR(30),
semester_year   VARCHAR(4)
);

CREATE TABLE members_committees
(
uteid           VARCHAR(20),
committee_id    NUMBER(5),
CONSTRAINT uteid_committee_pkk      PRIMARY KEY (uteid, committee_id),
CONSTRAINT uteid_fk                 FOREIGN KEY (UTEID) REFERENCES MEMBERS (UTEID),
CONSTRAINT committee_fk             FOREIGN KEY (COMMITTEE_ID) REFERENCES COMMITTEES (COMMITTEE_ID)
);
