
/* 
 // remove useless columns:
	alter table renewable_energy
	drop column Year;
	alter table renewable_energy
	drop column Household_ID ;
    alter table renewable_energy
	drop column Country ;
    alter table renewable_energy
	drop column Household_Size ;
    alter table renewable_energy
	drop column Monthly_Usage_kWh ;

 // check duplicates values

DELIMITER //
CREATE PROCEDURE CheckDuplValues()
BEGIN
SET @sql = concat('select *,count(*) as coun from renewable_energy', ' group by ',(select group_concat(column_name) from information_schema.columns where table_name = 'renewable_energy' and table_schema = database()), ' having count(*) > 1');

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END;

DELIMITER //

call CheckDuplValues()


// Check null values

DELIMITER 
CREATE PROCEDURE CheckNullValues()
BEGIN
	SET @sql = NULL;
    SELECT GROUP_CONCAT(CONCAT (column_name,' IS NULL') SEPARATOR ' OR ')
    INTO @sql
    FROM
    information_schema.columns WHERE table_name = 'renewable_energy' AND table_schema = DATABASE();
	
    SET @sql = CONCAT('SELECT * FROM renewable_energy WHERE ', @sql);
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
DELIMITER //

call CheckNullValues()
*/



