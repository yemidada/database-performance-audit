CREATE TABLE invoices (
    "id"  SERIAL PRIMARY KEY,
    "total_amount" numeric,
    "generated_at" date,
    "payed_at" date,
    "medical_history_id" int
);

ALTER TABLE invoices ADD FOREIGN KEY ("medical_history_id") REFERENCES medical_history("id");


CREATE TABLE invoice_items (
    "id"  SERIAL PRIMARY KEY,
    "unit_price" numeric,
    "quantity" int,
    "total_price" numeric,
    "invoice_id" int,
    "treatment_id" int
);

ALTER TABLE invoice_items ADD FOREIGN KEY ("treatment_id") REFERENCES treatments("id");
ALTER TABLE invoice_items ADD FOREIGN KEY ("invoice_id") REFERENCES invoices("id");


CREATE TABLE medical_history (
    "id"  SERIAL PRIMARY KEY,
    "admitted_at" date,
    "patient_id" int,
    "status" varchar
);

ALTER TABLE medical_history ADD FOREIGN KEY ("patient_id") REFERENCES patients("id");


CREATE TABLE patients (
    "id"  SERIAL PRIMARY KEY,
    "name" varchar,
    "date_of_birth" date
);

CREATE TABLE treatments (
    "id"  SERIAL PRIMARY KEY,
    "type" varchar,
    "name" varchar
);



CREATE TABLE medical_history_treatments (
    "id"  SERIAL PRIMARY KEY,
    "medical_history_id" int,
    "treatment_id" int
);

ALTER TABLE medical_history_treatments ADD FOREIGN KEY ("medical_history_id") REFERENCES medical_history("id");
ALTER TABLE medical_history_treatments ADD FOREIGN KEY ("treatment_id") REFERENCES treatments("id");

CREATE INDEX patient_index ON medical_histories(patient_id);
CREATE INDEX medical_histories_index ON invoices(medical_history__id);
CREATE INDEX treatments_idex ON invoice_items(treatment_id);
CREATE INDEX invoices_index ON invoice_items(invoice_id);
CREATE INDEX medical_history_index ON medical_history_treatments(medical_history_id);
CREATE INDEX medical_treatments_idx ON medical__history_treatments(treatment_id);
