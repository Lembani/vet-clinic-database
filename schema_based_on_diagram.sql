
CREATE TABLE patients (
  id INT SERIAL PRIMARY KEY,
  name VARCHAR(200),
  date_of_birth date
);

CREATE TABLE invoices (
  id  INT SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  CONSTRAINT fk_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);
