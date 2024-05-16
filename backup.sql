CREATE TABLE hotels (
    id INT PRIMARY KEY AUTO_INCREMENT,
    grade INT NOT NULL,
    address VARCHAR(128) NOT NULL
);

CREATE TABLE floors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hotel INT,
    level INT,
    FOREIGN KEY (hotel) REFERENCES hotels(id)
);

CREATE TABLE rooms (
    id INT PRIMARY KEY AUTO_INCREMENT,
    seats INT NOT NULL,
    floor INT NOT NULL,
    cost INT NOT NULL,
    FOREIGN KEY (floor) REFERENCES floors(id)
);

CREATE TABLE contracts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    person INT NOT NULL,
    room INT NOT NULL,
    start DATETIME NOT NULL,
    end DATETIME NOT NULL,
    creating_date DATETIME NOT NULL,
    status ENUM('created', 'paid', 'cancelled', 'done') NOT NULL DEFAULT 'created',
    FOREIGN KEY (person) REFERENCES persons(id),
    FOREIGN KEY (room) REFERENCES rooms(id)
);

CREATE TABLE feedbacks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(512),
    contract INT NOT NULL,
    score INT,
    FOREIGN KEY (contract) REFERENCES contracts(id)
);

CREATE TABLE companies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64),
    description VARCHAR(255)
)
