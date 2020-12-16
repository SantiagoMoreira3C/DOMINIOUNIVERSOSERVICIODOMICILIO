

/*Registro de solicitudes aceptadas, con el hijo, padre y niñera y el tipo de servicio.*/

SELECT NIÑERA_NOMBRE ||' '||NIÑERA_APELLIDO AS NIÑERA, HIJO_IDENTIDAD,HIJO_NOMBRE ||' '||HIJO_APELLIDO AS HIJO,
PADRE_NOMBRE ||'' ||PADRE_APELLIDO AS PADRE,TIPO_SERVICIO_NOMBRE,TIPO_SERVICIO_DESCRIPCION,
SOLICITUD_FECHA,SOLICITUD_COMENTARIO, SOLICITUD_ESTADO_ACEPTADA
FROM PADRE_HIJO INNER JOIN HIJO ON  HIJO.HIJO_ID=PADRE_HIJO.HIJO_ID
INNER JOIN PADRE ON HIJO.HIJO_ID = PADRE.PADRE_ID 
INNER JOIN SOLICITUD_SERVICIO ON SOLICITUD_SERVICIO.PADRE_ID = PADRE.PADRE_ID 
INNER JOIN NIÑERA ON SOLICITUD_SERVICIO.NIÑERA_ID= NIÑERA.NIÑERA_ID
INNER JOIN TIPO_SERVICIO ON TIPO_SERVICIO.TIPO_SERVICIO_ID=SOLICITUD_SERVICIO.TIPO_SERVICIO_ID
WHERE  SOLICITUD_ESTADO_ACEPTADA=TRUE


/*Niñeras y los cursos ha tomado, la sucursal a la que pertenece.*/
SELECT SUCURSAL_NOMBRE, CURSO_DETALLE,CURSO_FECHA,
NIÑERA_NOMBRE ||' '|| NIÑERA_APELLIDO AS NIÑERA
FROM NIÑERA_CURSO INNER JOIN CURSO ON NIÑERA_CURSO.CURSO_ID=CURSO.CURSO_ID
INNER JOIN NIÑERA ON NIÑERA.NIÑERA_ID=NIÑERA_CURSO.NIÑERA_ID
INNER JOIN SUCURSAL ON SUCURSAL.SUCURSAL_ID=NIÑERA.SUCURSAL_ID;


/*REGISTRO DE SERVICIOSCOMPLETADOS CON UNA CALIFICACION ALTA Y SU TARIFA*/
SELECT
SERVICIO_ID,NIÑERA_NOMBRE ||' '|| NIÑERA_APELLIDO AS NIÑERA,
PADRE_NOMBRE ||' '|| PADRE_APELLIDO AS PADRE, HIJO_NOMBRE, TIPO_SERVICIO_NOMBRE, SERVICIO_FECHAINICIO, SERVICIO_FECHAFIN,TARIFA_TIPO,
TARIFA_PRECIO,
SERVICIO_CALIFICACION_DETALLE AS CALIFICACION_SERVICIO,
(date_part('day',SERVICIO_FECHAFIN-SERVICIO_FECHAINICIO)* 24 ) + (date_part('hour',SERVICIO_FECHAFIN-SERVICIO_FECHAINICIO)) as horastotal,
((date_part('day',SERVICIO_FECHAFIN-SERVICIO_FECHAINICIO)* 24 ) + (date_part('hour',SERVICIO_FECHAFIN-SERVICIO_FECHAINICIO))) * TARIFA_PRECIO as totalgasto
FROM PADRE_HIJO INNER JOIN HIJO ON  HIJO.HIJO_ID=PADRE_HIJO.HIJO_ID
INNER JOIN PADRE ON HIJO.HIJO_ID = PADRE.PADRE_ID 
INNER JOIN SOLICITUD_SERVICIO ON SOLICITUD_SERVICIO.PADRE_ID = PADRE.PADRE_ID 
INNER JOIN NIÑERA ON SOLICITUD_SERVICIO.NIÑERA_ID= NIÑERA.NIÑERA_ID
INNER JOIN TIPO_SERVICIO ON TIPO_SERVICIO.TIPO_SERVICIO_ID=SOLICITUD_SERVICIO.TIPO_SERVICIO_ID
INNER JOIN SERVICIO ON SERVICIO.SOLICITUD_SERVICIO_ID=SOLICITUD_SERVICIO.SOLICITUD_SERVICIO_ID
INNER JOIN SERVICIO_CALIFICACION ON SERVICIO.SERVICIO_CALIFICACION_ID=SERVICIO_CALIFICACION.SERVICIO_CALIFICACION_ID
INNER JOIN PLAN_TARIFA ON SERVICIO.PLAN_TARIFA_ID=PLAN_TARIFA.PLAN_TARIFA_ID
INNER JOIN TARIFA ON TARIFA.TARIFA_ID=PLAN_TARIFA.TARIFA_ID
WHERE SERVICIO_CALIFICACION_DETALLE='ALTA';


/*MOSTRAR LOS TIPOS DE SERVICIOS CON SUS HORAS Y EN ORDEN DE PRECIO*/
SELECT 
TARIFA_TIPO,
TIPO_SERVICIO_NOMBRE,
TARIFA_HORARIOINICIO,
TARIFA_HORARIOFINAL,
TARIFA_PRECIO
FROM PLAN_TARIFA INNER JOIN TARIFA ON PLAN_TARIFA.TARIFA_ID=TARIFA.TARIFA_ID
INNER JOIN TIPO_SERVICIO ON TIPO_SERVICIO.TIPO_SERVICIO_ID=PLAN_TARIFA.TIPO_SERVICIO_ID
ORDER BY TARIFA_PRECIO;