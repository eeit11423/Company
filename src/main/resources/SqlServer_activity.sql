IF OBJECT_ID('dbo.ActCategory', 'U') IS NOT NULL 
  DROP TABLE dbo.ActCategory;

CREATE TABLE  ActCategory (
    id INTEGER NOT NULL,
    NAME VARCHAR(255),
    shortName VARCHAR(255),
    catid INTEGER,
    PRIMARY KEY (id)
) ;

IF OBJECT_ID('dbo.Department', 'U') IS NOT NULL 
  DROP TABLE dbo.Department;
    
CREATE TABLE   Department (
    id INTEGER NOT NULL IDENTITY,
    NAME VARCHAR(255),
    PRIMARY KEY (id)
) ;

INSERT INTO ActCategory VALUES 
	( 101, '藝術', '藝', 101), 
	( 111, '運動', '運', 111),	
	( 121, '聯誼', '誼', 121),
	( 131, '遊戲', '遊', 131),	
	( 141, '其他', '其他', 141);
	
INSERT INTO Department (name) VALUES
	(  '董事長'), 
	(  '管理部'),	
	(  '資訊部'),
	(  '工程部'),	
	(  '財務部');