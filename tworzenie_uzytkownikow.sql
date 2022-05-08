SHOW GRANTS FOR 'username'@'host';

CREATE user 'boss'@'%' IDENTIFIED BY 'szefu123';

GRANT ALL PRIVILEGES ON fakturowanie to 'boss'@'localhost';

CREATE user 'janusz'@'%' IDENTIFIED BY 'januszek2000';

GRANT SELECT ON fakturowanie.miasta to 'janusz'@'%';
GRANT INSERT ON fakturowanie.miasta to 'janusz'@'%';
GRANT UPDATE ON fakturowanie.miasta to 'janusz'@'%';
GRANT SELECT ON fakturowanie.asortyment to 'janusz'@'%';
GRANT INSERT ON fakturowanie.asortyment to 'janusz'@'%';
GRANT UPDATE ON fakturowanie.asortyment to 'janusz'@'%';

REVOKE UPDATE on fakturowanie.miasta FROM janusz;
REVOKE ALL PRIVILEGES on fakturowanie.* FROM boss;
DROP USER 'boss'@'%';