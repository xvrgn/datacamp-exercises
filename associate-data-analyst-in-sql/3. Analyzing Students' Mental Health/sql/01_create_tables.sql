CREATE SCHEMA student_mentalhealth_db;

CREATE TYPE inter_dom_enum AS ENUM ('Inter', 'Dom');
CREATE TYPE gender_enum AS ENUM ('Male', 'Female');
CREATE TYPE acad_enum AS ENUM ('Grad', 'Under');
CREATE TYPE stay_cate_enum AS ENUM ('Short', 'Medium', 'Long');
CREATE TYPE jap_cate_enum AS ENUM ('Low', 'Average', 'High');
CREATE TYPE eng_cate_enum AS ENUM ('Low', 'Average', 'High');

DROP TABLE IF EXISTS students;
CREATE TABLE students (
    inter_dom inter_dom_enum,
    region VARCHAR(10),
    gender  gender_enum,
    academic acad_enum,
    age INT,
    age_cate INT,
    stay INT,
    stay_cate stay_cate_enum,
    japanese INT,
    japanese_cate jap_cate_enum,
    english INT,
    english_cate eng_cate_enum,
    intimate VARCHAR(25),
    religion VARCHAR(25),
    suicide VARCHAR(25),
    dep VARCHAR(25),
    deptype VARCHAR(25),
    todep INT,
    depsev VARCHAR(25),
    tosc INT,
    apd INT,
    ahome INT,
    aph INT,
    afear INT,
    acs INT,
    aguilt INT,
    amiscell INT,
    toas INT,
    partner INT,
    friends INT,
    parents INT,
    relative INT,
    profess INT,
    phone INT,
    doctor INT,
    reli INT,
    alone INT,
    others INT,
    internet INT,
    partner_bi VARCHAR(25),
    friends_bi VARCHAR(25),
    parents_bi VARCHAR(25),
    relative_bi VARCHAR(25),
    professional_bi VARCHAR(25),
    phone_bi VARCHAR(25),
    doctor_bi VARCHAR(25),
    religion_bi VARCHAR(25),
    alone_bi VARCHAR(25),
    others_bi VARCHAR(25),
    internet_bi VARCHAR(25)
);
