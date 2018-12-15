USE Minions

ALTER TABLE Users

ADD CONSTRAINT PasswordMinLength CHECK(LEN(password)>=5);