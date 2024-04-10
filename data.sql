INSERT INTO majors (active, name)
VALUES ('Yes', 'Major Name');

INSERT INTO programs (active, credits, elective_credits, major_id, year)
VALUES ('Yes', 120, 60, 1, 2023);

INSERT INTO users (login, password, name, program_id, superuser, last, first)
VALUES ('lucas', '$2y$10$xn3PjFXFydbrU5mryqilf.4jR5ostSo0cKVyZAV1msLGQ/rOFJ34i', 'Lucas', 1, 'Yes', 'Martin', 'Lucas');