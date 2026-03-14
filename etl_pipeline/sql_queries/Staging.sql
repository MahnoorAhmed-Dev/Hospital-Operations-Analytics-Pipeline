CREATE TABLE staging.stg_hospitals (
    reporting_unit_code TEXT,
    reporting_unit_name TEXT,
    state TEXT,
    type TEXT
);


CREATE TABLE staging.stg_measures (
    measure_code TEXT,
    measure_name TEXT,
    description TEXT,
    unit TEXT
);


CREATE TABLE staging.stg_reported_measure_values (
    reporting_unit_code TEXT,
    measure_code TEXT,
    reported_measure_code TEXT,
    reported_measure_name TEXT,
    data_period TEXT,
    value NUMERIC
);
