CREATE TABLE warehouse.dim_hospital (
    hospital_id SERIAL PRIMARY KEY,
    reporting_unit_code VARCHAR(20) UNIQUE NOT NULL,
    hospital_name TEXT NOT NULL,
    state TEXT,
    hospital_type TEXT
);


CREATE TABLE warehouse.dim_measure (
    measure_id SERIAL PRIMARY KEY,
    measure_code VARCHAR(20) UNIQUE NOT NULL,
    measure_name TEXT NOT NULL,
    description TEXT,
    unit TEXT
);


CREATE TABLE warehouse.dim_reported_measure (
    reported_measure_id SERIAL PRIMARY KEY,
    reported_measure_code VARCHAR(30) UNIQUE NOT NULL,
    reported_measure_name TEXT NOT NULL,
    measure_code VARCHAR(20) NOT NULL,
    FOREIGN KEY (measure_code) REFERENCES warehouse.dim_measure(measure_code)
);


CREATE TABLE warehouse.dim_time (
    time_id SERIAL PRIMARY KEY,
    data_period VARCHAR(20) UNIQUE NOT NULL
);



CREATE TABLE warehouse.fact_measure_performance (
    fact_id BIGSERIAL PRIMARY KEY,
    hospital_id INT NOT NULL,
    measure_id INT NOT NULL,
    reported_measure_id INT NOT NULL,
    time_id INT NOT NULL,
    value NUMERIC,

    FOREIGN KEY (hospital_id) REFERENCES warehouse.dim_hospital(hospital_id),
    FOREIGN KEY (measure_id) REFERENCES warehouse.dim_measure(measure_id),
    FOREIGN KEY (reported_measure_id) REFERENCES warehouse.dim_reported_measure(reported_measure_id),
    FOREIGN KEY (time_id) REFERENCES warehouse.dim_time(time_id)
);




SELECT
    h.hospital_name,
    m.measure_name,
    m.unit,
    f.value
FROM warehouse.fact_measure_performance f
JOIN warehouse.dim_hospital h ON f.hospital_id = h.hospital_id
JOIN warehouse.dim_measure m ON f.measure_id = m.measure_id;



