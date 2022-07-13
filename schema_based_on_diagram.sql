CREATE DATABASE clinic;

CREATE TABLE patients (
  id INT SERIAL PRIMARY KEY,
  name VARCHAR(200),
  date_of_birth date
);

CREATE TABLE invoices (
  id INT SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  CONSTRAINT fk_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE medical_histories (
  id INT SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(200),
  CONSTRAINT fk_patients FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE medical_treatments (
  id INT SERIAL PRIMARY KEY,
  treatment_id INT,
  medical_histories_id INT,
  CONSTRAINT fk_treatments FOREIGN KEY(treatment_id) REFERENCES treatments(id),
  CONSTRAINT fk_medical_histories FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id)
);


CREATE TABLE invoice_items (
  id INT SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  CONSTRAINT fk_invoices FOREIGN KEY(invoice_id) REFERENCES invoices(id),
  CONSTRAINT fk_treatments FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

CREATE TABLE treatments (
  id INT SERIAL PRIMARY KEY,
  type VARCHAR(200),
  name VARCHAR(200),
  medical_histories_id INT,
  CONSTRAINT fk_medical_histories FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id)
);


-- FOREIGN KEY INDEXES

CREATE INDEX idx_medical_histories_patient_id ON medical_histories(patient_id);

CREATE INDEX idx_invoices_medical_history_id  ON invoices(medical_history_id);

CREATE INDEX idx_invoice_items_invoice_id ON invoice_items(invoice_id);

CREATE INDEX idx_invoice_items_treatment_id ON invoice_items(treatment_id);

