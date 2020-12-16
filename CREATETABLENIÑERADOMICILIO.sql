/* TABLA: CIUDAD */
CREATE  TABLE CIUDAD(
CIUDAD_ID SMALLINT PRIMARY KEY NOT NULL,
CIUDAD_NOMBRE VARCHAR(50) NOT NULL
);

/* TABLA: SUCURSAL */
CREATE  TABLE SUCURSAL(
SUCURSAL_ID SMALLINT PRIMARY KEY NOT NULL,
CIUDAD_ID SMALLINT NOT NULL,
SUCURSAL_NOMBRE VARCHAR(50) NOT NULL,
SUCURSAL_DIRECCION VARCHAR(50) NOT NULL,
SUCURSAL_CELULAR VARCHAR(10) NOT NULL,
CONSTRAINT CIUDAD_ID_FK FOREIGN KEY (CIUDAD_ID) REFERENCES CIUDAD(CIUDAD_ID)
  ON DELETE RESTRICT ON UPDATE CASCADE
);

/* TABLA: COOPERATIVA */
CREATE  TABLE COOPERATIVA(
COOPERATIVA_ID SMALLINT PRIMARY KEY NOT NULL,
SUCURSAL_ID SMALLINT NOT NULL,
COOPERATIVA_NOMBRE VARCHAR(50) NOT NULL,
CONSTRAINT SUCURSAL_ID_FK FOREIGN KEY (SUCURSAL_ID) REFERENCES SUCURSAL(SUCURSAL_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE
);

/* TABLA: TAXI */
CREATE  TABLE TAXI(
TAXI_PLACA VARCHAR(3) PRIMARY KEY NOT NULL,
COOPERATIVA_ID SMALLINT NOT NULL,	
TAXI_MARCA VARCHAR(50) NOT NULL,
TAXI_MODELO VARCHAR(50) NOT NULL,
CONSTRAINT COOPERATIVA_ID_FK FOREIGN KEY (COOPERATIVA_ID) REFERENCES COOPERATIVA(COOPERATIVA_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE
);

/* TABLA: NIÑERA */
CREATE  TABLE NIÑERA(
NIÑERA_ID SMALLINT PRIMARY KEY NOT NULL,
SUCURSAL_ID SMALLINT NOT NULL,	
NIÑERA_NOMBRE VARCHAR(50) NOT NULL,	
NIÑERA_APELLIDO VARCHAR(50) NOT NULL,	
NIÑERA_DATE_NACIMIENTO DATE NOT NULL,
NIÑERA_DATE_INGRELABORAL DATE NOT NULL,
CONSTRAINT SUCURSAL_ID_FK FOREIGN KEY (SUCURSAL_ID) REFERENCES SUCURSAL(SUCURSAL_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE
);

/* TABLA: CURSO */
CREATE  TABLE CURSO(
CURSO_ID SMALLINT PRIMARY KEY NOT NULL,
SUCURSAL_ID INTEGER NOT NULL,	
CURSO_DETALLE VARCHAR(50) NOT NULL,	
CURSO_FECHA DATE NOT NULL,	
CONSTRAINT SUCURSAL_ID_FK FOREIGN KEY (SUCURSAL_ID) REFERENCES SUCURSAL(SUCURSAL_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE
);

/* TABLA: NIÑERA_CURSO */
CREATE  TABLE NIÑERA_CURSO(
CURSO_ID INTEGER NOT NULL,
NIÑERA_ID INTEGER NOT NULL,	
PRIMARY KEY(CURSO_ID, NIÑERA_ID),
CONSTRAINT CURSO_ID_FK FOREIGN KEY (CURSO_ID) REFERENCES CURSO(CURSO_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT NIÑERA_ID_FK FOREIGN KEY (NIÑERA_ID) REFERENCES NIÑERA(NIÑERA_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE
);

/* TABLA: PADRE */
CREATE  TABLE PADRE(
PADRE_ID SMALLINT PRIMARY KEY NOT NULL,
PADRE_IDENTIDAD VARCHAR(10) NOT NULL, 
PADRE_NOMBRE VARCHAR(50) NOT NULL, 
PADRE_APELLIDO VARCHAR(50) NOT NULL, 	
PADRE_CELULAR VARCHAR(50) NOT NULL,
PADRE_DIRECCION VARCHAR(50) NOT NULL,
PADRE_CORREO VARCHAR(50) NOT NULL
);

/* TABLA: HIJO */
CREATE  TABLE HIJO(
HIJO_ID SMALLINT PRIMARY KEY NOT NULL,
HIJO_IDENTIDAD VARCHAR(10) NOT NULL,
HIJO_NOMBRE VARCHAR(50) NOT NULL, 
HIJO_APELLIDO VARCHAR(50) NOT NULL, 
HIJO_FECNACIMIENTO DATE NOT NULL
);

/* TABLA: PADRE_HIJO */
CREATE  TABLE PADRE_HIJO(
PADRE_ID SMALLINT NOT NULL,
HIJO_ID SMALLINT NOT NULL,
PRIMARY KEY(PADRE_ID,HIJO_ID),
CONSTRAINT PADRE_ID_FK FOREIGN KEY (PADRE_ID) REFERENCES PADRE(PADRE_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT HIJO_ID_FK FOREIGN KEY (HIJO_ID) REFERENCES HIJO(HIJO_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE	
);

/* TABLA: TIPO_SERVICIO */
CREATE  TABLE TIPO_SERVICIO(
TIPO_SERVICIO_ID SMALLINT PRIMARY KEY NOT NULL,
SUCURSAL_ID SMALLINT NOT NULL,	
TIPO_SERVICIO_NOMBRE VARCHAR(50) NOT NULL,
TIPO_SERVICIO_DESCRIPCION VARCHAR(50) NOT NULL, 
CONSTRAINT SUCURSAL_ID_FK FOREIGN KEY (SUCURSAL_ID) REFERENCES SUCURSAL(SUCURSAL_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE
);



/* TABLA: TARIFA */
CREATE  TABLE TARIFA(
TARIFA_ID SMALLINT PRIMARY KEY NOT NULL,	
TARIFA_TIPO VARCHAR(50) NOT NULL,
TARIFA_HORARIOINICIO TIME NOT NULL,
TARIFA_HORARIOFINAL TIME NOT NULL,
TARIFA_PRECIO NUMERIC(5,2) NOT NULL
);

/*TABLA: PLAN_TARIFA*/

CREATE TABLE PLAN_TARIFA(
PLAN_TARIFA_ID VARCHAR(3) PRIMARY KEY NOT NULL,
TIPO_SERVICIO_ID SMALLINT NOT NULL,
TARIFA_ID SMALLINT NOT NULL,
CONSTRAINT TIPO_SERVICIO_ID_FK FOREIGN KEY (TIPO_SERVICIO_ID) REFERENCES TIPO_SERVICIO(TIPO_SERVICIO_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT TARIFA_ID_FK FOREIGN KEY (TARIFA_ID) REFERENCES TARIFA(TARIFA_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE
);

/* TABLA: SOLICITUD SERVICIO */
CREATE  TABLE SOLICITUD_SERVICIO(
SOLICITUD_SERVICIO_ID SMALLINT PRIMARY KEY NOT NULL,
SUCURSAL_ID SMALLINT NOT NULL,		
TIPO_SERVICIO_ID SMALLINT NOT NULL,	
NIÑERA_ID INTEGER NOT NULL, 
PADRE_ID INTEGER NOT NULL,
SOLICITUD_FECHA TIMESTAMP NOT NULL,
SOLICITUD_COMENTARIO VARCHAR(199) NOT NULL,
SOLICITUD_ESTADO_ACEPTADA BOOLEAN NOT NULL,
CONSTRAINT SUCURSAL_ID_FK FOREIGN KEY (SUCURSAL_ID) REFERENCES SUCURSAL(SUCURSAL_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT TIPO_SERVICIO_ID_FK FOREIGN KEY (TIPO_SERVICIO_ID) REFERENCES TIPO_SERVICIO(TIPO_SERVICIO_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT NIÑERA_ID_FK FOREIGN KEY (NIÑERA_ID) REFERENCES NIÑERA(NIÑERA_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT PADRE_ID_FK FOREIGN KEY (PADRE_ID) REFERENCES PADRE(PADRE_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE	
);
	

/* TABLA: TAXI_ASIGNADO */
CREATE  TABLE TAXI_ASIGNADO(
TAXI_ASIGNADO_ID SMALLINT PRIMARY KEY NOT NULL,
TAXI_PLACA VARCHAR(3) NOT NULL,
NIÑERA_ID SMALLINT NOT NULL,
SOLICITUD_SERVICIO_ID SMALLINT NOT NULL,	
CONSTRAINT TAXI_PLACA_FK FOREIGN KEY (TAXI_PLACA) REFERENCES TAXI(TAXI_PLACA)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT NIÑERA_ID_FK FOREIGN KEY (NIÑERA_ID) REFERENCES NIÑERA(NIÑERA_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE,	
CONSTRAINT SOLICITUD_SERVICIO_ID_FK FOREIGN KEY (SOLICITUD_SERVICIO_ID) REFERENCES SOLICITUD_SERVICIO(SOLICITUD_SERVICIO_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE
);

/* TABLA: SERVICIO CALIFICACION */
CREATE  TABLE SERVICIO_CALIFICACION(
SERVICIO_CALIFICACION_ID SMALLINT PRIMARY KEY NOT NULL,
SERVICIO_CALIFICACION_DETALLE VARCHAR(50) NOT NULL
);


/* TABLA: SERVICIO */
CREATE  TABLE SERVICIO(
SERVICIO_ID SMALLINT PRIMARY KEY NOT NULL,
SOLICITUD_SERVICIO_ID SMALLINT NOT NULL,	
SERVICIO_CALIFICACION_ID SMALLINT NOT NULL,
PLAN_TARIFA_ID VARCHAR(3) NOT NULL,	
SERVICIO_FECHAINICIO TIMESTAMP NOT NULL,		
SERVICIO_FECHAFIN TIMESTAMP NOT NULL,
SERVICIO_ESTADO_COMPLETADO BOOLEAN  NOT NULL,	
CONSTRAINT SOLICITUD_SERVICIO_ID_FK FOREIGN KEY (SOLICITUD_SERVICIO_ID) REFERENCES SOLICITUD_SERVICIO(SOLICITUD_SERVICIO_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT SERVICIO_CALIFICACION_ID_FK FOREIGN KEY (SERVICIO_CALIFICACION_ID) REFERENCES SERVICIO_CALIFICACION(SERVICIO_CALIFICACION_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT PLAN_TARIFA_ID_FK FOREIGN KEY (PLAN_TARIFA_ID) REFERENCES PLAN_TARIFA(PLAN_TARIFA_ID)
 ON DELETE RESTRICT ON UPDATE CASCADE
);





