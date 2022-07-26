const kCreateTaskTable =  
  'CREATE TABLE task ('
  ' id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'
  ' title VARCHAR(50) NOT NULL,'
  ' short_description VARCHAR(50) NOT NULL,'
  ' long_description VARCHAR(200) NOT NULL,'
  ' date DATETIME NOT NULL,'
  ' id_status int NOT NULL,'
  ' CONSTRAINT fk_status FOREIGN KEY (id_status) REFERENCES status(id)'
  ' ON DELETE CASCADE'
  ' ON UPDATE CASCADE)';

const kCreateStatusTable = 
  'CREATE TABLE status ('
  ' id INTEGER NOT NULL PRIMARY KEY,'
  ' status VARCHAR(30) NOT NULL)';

const kInsertCompletedStatus = "INSERT INTO status VALUES(1, 'Completada')";
const kInsertPendingStatus = "INSERT INTO status VALUES(2, 'Pendiente')";
const kInsertAllStatus = "INSERT INTO status VALUES(3, 'Todo')";
const kInsertTodayStatus = "INSERT INTO status VALUES(4, 'Para hoy')";
const kInsertOverdueStatus = "INSERT INTO status VALUES(5, 'Vencidas')";