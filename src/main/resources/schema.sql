CREATE DATABASE command_and_control_db;


CREATE TABLE session_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    SESSION_ID VARCHAR(255) NOT NULL,
    SESSION_REMOTE_ADDRESS VARCHAR(255) NOT NULL,
    SESSION_LOCAL_ADDRESS VARCHAR(255) NOT NULL,
    SESSION_CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    SESSION_CLOSED_AT TIMESTAMP,
    OS_NAME VARCHAR(255),
    OS_VERSION VARCHAR(255),
    OS_ARCH VARCHAR(255),
    USERNAME VARCHAR(255),
    USER_HOME VARCHAR(255),
    USER_CURRENT_WORKING_DIR VARCHAR(255),
    USER_LANGUAGE VARCHAR(255)
);

ALTER TABLE session_logs
ADD CONSTRAINT SESSION_ID_UC UNIQUE (SESSION_ID);

ALTER TABLE session_logs
ADD COLUMN HAS_Files VARCHAR(1);

CREATE TABLE session_files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_logs_ID INT,
    FILE VARCHAR(999) NOT NULL,
    FILE_STATUS VARCHAR(255) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,

    FOREIGN KEY (session_logs_ID) REFERENCES session_logs(id) ON DELETE SET NULL
);

ALTER TABLE session_files
ADD COLUMN UPDATED_AT TIMESTAMP;