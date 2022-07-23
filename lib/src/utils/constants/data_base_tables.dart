const kCreateTaskTable =  
  'CREATE TABLE task ('
  ' id INT NOT NULL,'
  ' title VARCHAR(50) NOT NULL,'
  ' short_description VARCHAR(50) NOT NULL,'
  ' long_description VARCHAR(200) NOT NULL,'
  ' idStatus int NOT NULL,'
  ' CONSTRAINT fk_status FOREIGN KEY (idStatus) REFERENCES status(id)'
  ' ON DELETE CASCADE'
  ' ON UPDATE CASCADE,'
  ' PRIMARY KEY(id)';

const kCreateStatusTable = 
  'CREATE TABLE status ('
  ' id INT NOT NULL PRIMARY KEY,'
  ' status VARCHAR(30) NOT NULL';

const kInsertCompletedStatus = 'INSERT INTO status VALUES(1, "Completada")';
const kInsertPendingStatus = 'INSERT INTO status VALUES(2, "Pendiente")';