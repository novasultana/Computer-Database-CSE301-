CREATE TABLE books (
book_id INTEGER NOT NULL,
copy_id INTEGER NOT NULL,
books_name VARCHAR(64) NOT NULL,
authour VARCHAR(64),
catagory VARCHAR(32),
status_of_books VARCHAR(16),
price INTEGER
);
ALTER TABLE books ADD CONSTRAINT books_pk PRIMARY KEY ( copy_id );
CREATE TABLE borrowed (
userss_users_id VARCHAR(16) NOT NULL,
books_copy_id INTEGER NOT NULL,
book_submit_date DATE,
book_last_date DATE NOT NULL,
fine VARCHAR(10)
);
ALTER TABLE borrowed ADD CONSTRAINT borrowed_pk PRIMARY KEY ( userss_users_id,
books_copy_id );
CREATE TABLE faculty_info (
faculty_id VARCHAR(16) NOT NULL,
faculty_name VARCHAR(32),
userss_users_id VARCHAR(16) NOT NULL
);
CREATE UNIQUE INDEX faculty_info__idx ON
faculty_info (
userss_users_id
ASC );

ALTER TABLE faculty_info ADD CONSTRAINT faculty_info_pk PRIMARY KEY ( faculty_id );
CREATE TABLE issues (
userss_users_id VARCHAR(16) NOT NULL,
books_copy_id INTEGER NOT NULL,
issue_id INTEGER,
issue_date DATE
);

ALTER TABLE issues ADD CONSTRAINT issues_pk PRIMARY KEY ( userss_users_id,
books_copy_id );

CREATE TABLE student_info (
student_id VARCHAR(16) NOT NULL,
student_name VARCHAR(32),
userss_users_id VARCHAR(16) NOT NULL
);
CREATE UNIQUE INDEX student_info__idx ON
student_info (
userss_users_id
ASC );
ALTER TABLE student_info ADD CONSTRAINT student_info_pk PRIMARY KEY ( student_id );
CREATE TABLE userss (
users_id VARCHAR(16) NOT NULL,
users_name VARCHAR(16)
);
ALTER TABLE userss ADD CONSTRAINT userss_pk PRIMARY KEY ( users_id );
ALTER TABLE borrowed
ADD CONSTRAINT borrowed_books_fk FOREIGN KEY ( books_copy_id )
REFERENCES books ( copy_id );

ALTER TABLE borrowed
ADD CONSTRAINT borrowed_userss_fk FOREIGN KEY ( userss_users_id )
REFERENCES userss ( users_id );
ALTER TABLE faculty_info
ADD CONSTRAINT faculty_info_userss_fk FOREIGN KEY ( userss_users_id )
REFERENCES userss ( users_id );

ALTER TABLE issues
ADD CONSTRAINT issues_books_fk FOREIGN KEY ( books_copy_id )
REFERENCES books ( copy_id );
ALTER TABLE issues
ADD CONSTRAINT issues_userss_fk FOREIGN KEY ( userss_users_id )
REFERENCES userss ( users_id );

ALTER TABLE student_info
ADD CONSTRAINT student_info_userss_fk FOREIGN KEY ( userss_users_id )
REFERENCES userss ( users_id );