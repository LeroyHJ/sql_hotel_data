drop DATABASE IF EXISTS mthree_hotel;

CREATE DATABASE mthree_hotel;

use mthree_hotel;

Create table Rooms (
    room_id int auto_increment PRIMARY KEY,
    room_number int NOT NULL,
    room_type Varchar(10) NOT NULL,
    standard_guest int NOT NULL,
    max_guest int NOT NULL,
    Base_price DECIMAL(3, 2) NOT NULL,
    Extra_person_price DECIMAL(2, 2) NOT NULL
);

Create table Guests (
    guest_id INT auto_increment PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    address Varchar(50) NOT NULL,
    City Varchar(20) NOT NULL,
    state Varchar(20) NOT NULL,
    zip_code Varchar(10) NOT NULL,
    phone Varchar(15) NOT NULL,
    reservation_id INT NOT NULL,
    room_id INT NOT NULL
    -- FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id),
--     FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);


Create table Reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    number_of_guests INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    reservation_status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE amenities(
    amenities_id INT AUTO_INCREMENT PRIMARY KEY,
    microwave BOOLEAN NOT NULL,
    refrigerator BOOLEAN NOT NULL,
    jaccuzi BOOLEAN NOT NULL,
    ADA_Accesible BOOLEAN NOT NULL
);

create TABLE room_amenities(
    room_id INT NOT NULL,
    amenities_id INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
    FOREIGN KEY (amenities_id) REFERENCES amenities(amenities_id)
);