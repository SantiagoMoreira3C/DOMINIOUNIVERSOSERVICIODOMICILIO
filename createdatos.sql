/* DATOS INSERTADOS EN LA TABLA : CIUDAD */
INSERT INTO CIUDAD VALUES(1,'QUITO');
/* DATOS INSERTADOS EN LA TABLA : SUCURSAL */
INSERT INTO SUCURSAL VALUES(1,1,'BABY SISTER','CALLE 300', '0989175713');
/* DATOS INSERTADOS EN LA TABLA : COOPERATIVA */
INSERT INTO COOPERATIVA VALUES(1,1,'TAXI SM ENTERPRISE');
/* DATOS INSERTADOS EN LA TABLA : TAXI */
INSERT INTO TAXI VALUES('T01',1,'TAXI KIA','TAXI MERCEDES');
INSERT INTO TAXI VALUES('T02',1,'TAXI SEPHIA','TAXI FORD');

/* DATOS INSERTADOS EN LA TABLA : NIÑERA */
INSERT INTO NIÑERA VALUES(1,1,'VERONICA','TUAREZ','1985/08/27','2005/09/13');
INSERT INTO NIÑERA VALUES(2,1,'PAULINA','VELEZ','1990/11/17','2008/03/22');
INSERT INTO NIÑERA VALUES(3,1,'LUCIANA','MORRIS','1983/02/24','2014/09/14');

/* DATOS INSERTADOS EN LA TABLA : CURSO */
INSERT INTO CURSO VALUES(1,1,'PRIMEROS AUXILIOS','2020/01/12');
INSERT INTO CURSO VALUES(2,1,'FUNDAMENTOS DE LA NIÑEZ','2020/01/19');
INSERT INTO CURSO VALUES(3,1,'ESTIMULACION TEMPRANA','2020/02/09');
INSERT INTO CURSO VALUES(4,1,'NUTRICION PARA NIÑOS','2020/05/18');

/* DATOS INSERTADOS EN LA TABLA : NIÑERA_CURSO */
INSERT INTO NIÑERA_CURSO VALUES(1,1);
INSERT INTO NIÑERA_CURSO VALUES(1,2);
INSERT INTO NIÑERA_CURSO VALUES(1,3);
INSERT INTO NIÑERA_CURSO VALUES(2,1);
INSERT INTO NIÑERA_CURSO VALUES(2,2);
INSERT INTO NIÑERA_CURSO VALUES(2,3);
INSERT INTO NIÑERA_CURSO VALUES(3,1);
INSERT INTO NIÑERA_CURSO VALUES(3,3);
INSERT INTO NIÑERA_CURSO VALUES(4,2);
INSERT INTO NIÑERA_CURSO VALUES(4,3);

/* DATOS INSERTADOS EN LA TABLA : PADRE */
INSERT INTO PADRE VALUES(1,'1314857439','PEDRO','TORRES','0986685981','Alado de la Parque la rotonda','PTORRES@GMAIL.COM');
INSERT INTO PADRE VALUES(2,'1311816266','RAFAEL','MONCES','0111251969','Diagonal a la iglesia','RPONCES@GMAIL.COM');
INSERT INTO PADRE VALUES(3,'1313790048','NESTOR','BIDAL','09119882835','PANECILLO CALLE 2','NBIDAL@GMAIL.COM');
INSERT INTO PADRE VALUES(4,'1314018470','SEBASTIAN','HERRERA','0923419220','MONUMENTO AVE 9','SHERRERA@GMAIL.COM');
/* DATOS INSERTADOS EN LA TABLA : HIJO */
INSERT INTO HIJO VALUES(1,'1315222133','STEVEN','TORRES','2018/02/27');
INSERT INTO HIJO VALUES(2,'1315515141','CRISTHIAN','MONCES','2019/01/01');
INSERT INTO HIJO VALUES(3,'1315670101','JUAN','BIDAL','2019/07/17');
INSERT INTO HIJO VALUES(4,'1375917249','MATEO','HERRERA','2019/08/30');

/* DATOS INSERTADOS EN LA TABLA : PADRE_HIJO */
INSERT INTO PADRE_HIJO VALUES(1,1);
INSERT INTO PADRE_HIJO VALUES(2,2);
INSERT INTO PADRE_HIJO VALUES(3,3);
INSERT INTO PADRE_HIJO VALUES(4,4);
/* DATOS INSERTADOS EN LA TABLA : TIPO_SERVICIO*/

INSERT INTO TIPO_SERVICIO VALUES(1,1,'NIÑERA POR HORAS','DESEA SALIR UN SÁBADO POR LA NOCHE');
INSERT INTO TIPO_SERVICIO VALUES(2,1,'NIÑERA ESPECIALIZADA PERMANENTE','NIÑERA CUIDANDO DÍA A DÍA');
INSERT INTO TIPO_SERVICIO VALUES(3,1,'NIÑERA PARA EVENTOS','EQUIPO DE NIÑERAS AL PEDIENTE DE TUS NIÑOS');

/* DATOS INSERTADOS EN LA TABLA : TARIFA*/
INSERT INTO TARIFA VALUES(1,'TARIFA H1','07:00:00','19:00:00',15.00);
INSERT INTO TARIFA VALUES(2,'TARIFA H2','19:01:59','6:59:59',23.50);
INSERT INTO TARIFA VALUES(3,'TARIFA EP1','08:00:00','18:59:59',3.25);
INSERT INTO TARIFA VALUES(4,'TARIFA EP2','19:00:59','07:59:59',3.75);
INSERT INTO TARIFA VALUES(5,'TARIFA EV1','07:00:00','14:59:59',30.00);
INSERT INTO TARIFA VALUES(6,'TARIFA EV2','15:00:00','06:59:59',40.00);

/* DATOS INSERTADOS EN LA TABLA : PLAN_TARIFA*/

INSERT INTO PLAN_TARIFA VALUES('TH1',1,1);
INSERT INTO PLAN_TARIFA VALUES('TH2',1,2);
INSERT INTO PLAN_TARIFA VALUES('TH3',2,3);
INSERT INTO PLAN_TARIFA VALUES('TH4',2,4);
INSERT INTO PLAN_TARIFA VALUES('TH5',3,5);
INSERT INTO PLAN_TARIFA VALUES('TH6',3,6);

/* DATOS INSERTADOS EN LA TABLA : SOLICITUD_SERVICIO*/

INSERT INTO SOLICITUD_SERVICIO VALUES(1,1,1,1,1,'2020/12/08 13:00:00','JUEVES 10 DE 2:30 A 2:50 DE LA MADRUGADA',FALSE);
INSERT INTO SOLICITUD_SERVICIO VALUES(2,1,3,1,2,'2020/12/08 15:50:00','JUEVES 10 DESDE 8 A 11 PM',TRUE);
INSERT INTO SOLICITUD_SERVICIO VALUES(3,1,1,2,3,'2020/12/08 16:00:00','VIERNES 11 DESDE 8 A 11:30 AM ',TRUE);
INSERT INTO SOLICITUD_SERVICIO VALUES(4,1,1,2,4,'2020/12/08 20:50:00','SÁBADO 12 DESDE 7:30 PM A 11:15 PM',TRUE);
INSERT INTO SOLICITUD_SERVICIO VALUES(5,1,1,3,1,'2020/12/09 08:00:00','DOMINGO 12 DESDE 7:11 A 10 AM',TRUE);
INSERT INTO SOLICITUD_SERVICIO VALUES(6,1,2,3,2,'2020/12/12 21:00:00','DICIEMBRE DESDE 13 AL 23',TRUE);
INSERT INTO SOLICITUD_SERVICIO VALUES(7,1,3,1,1,'2020/12/13 18:10:00','DOMINGO 24 23:20 A 23:40 PM', FALSE);

/* DATOS INSERTADOS EN LA TABLA : TAXI_ASIGNADO*/
INSERT INTO TAXI_ASIGNADO VALUES(1,'T01',1,2);
INSERT INTO TAXI_ASIGNADO VALUES(2,'T01',2,4);
INSERT INTO TAXI_ASIGNADO VALUES(3,'T02',3,6);

/* DATOS INSERTADOS EN LA TABLA : SERVICIO CALIFICACION*/
INSERT INTO SERVICIO_CALIFICACION VALUES(1,'BAJA');
INSERT INTO SERVICIO_CALIFICACION VALUES(2,'REGULAR');
INSERT INTO SERVICIO_CALIFICACION VALUES(3,'ALTA');
INSERT INTO SERVICIO_CALIFICACION VALUES(4,'IMPECABLE');

/* DATOS INSERTADOS EN LA TABLA : SERVICIO*/
INSERT INTO SERVICIO VALUES(1,2,3,'TH6','2020/12/10 20:00:00','2020/12/13 23:00:00', TRUE);
INSERT INTO SERVICIO VALUES(2,3,2,'TH1','2020/12/11 08:00:00','2020/12/11 11:00:00', TRUE);
INSERT INTO SERVICIO VALUES(3,4,3,'TH2','2020/12/12 19:30:00','2020/12/12 23:15:00', TRUE);
INSERT INTO SERVICIO VALUES(4,5,4,'TH1','2020/12/12 07:11:00','2020/12/12 10:00:00', TRUE);
INSERT INTO SERVICIO VALUES(5,5,2,'TH3','2020/12/13 00:01:00','2020/12/23 23:59:00', FALSE);



