USE db_control_academico_in5bm;

-- --------calls alumnos-------------------------------------------
CALL sp_alumnos_create("2021001","Juan","Paco","Pedro","Perez","Lopez");
CALL sp_alumnos_create("2021002","Marta","Lorena","","Gonzalez","Lopez");
CALL sp_alumnos_create("2021003","Maria","Jimena","","Ramirez","");
CALL sp_alumnos_create("2021004","Julian","Alberto","Belarmino","Tzun","Acabal");
CALL sp_alumnos_create("2021005","Alex","Gabriel","Manuel","Archila","Marroquin");
CALL sp_alumnos_create("2021006","Donaldo","Henry","","Lopez","Urizar");
CALL sp_alumnos_create("2021007","Jhonatan","Gabriel","Ramiro","Casasola","Sanchez");
CALL sp_alumnos_create("2021008","Pedro","Armando","Daniel","Dubon","Carbajal");
CALL sp_alumnos_create("2021009","Jimena","Rosario","","Hernandez","Vazques");
CALL sp_alumnos_create("2021010","Melany","Mariela","","Felipe","Canel");

-- ----------call instructores-----------------------------------
CALL sp_instructores_create("Marco","Gabriel","Francisco","Tzun","Perez","18 av a lote 124 col las victorias","marco@kinal.edu","45678987",'2000/11/15');
CALL sp_instructores_create("Juan","Francisco","","Dubon","Garcia","20 av a lote 12 col la eurecka","juan@kinal.edu","11665543",'1995/10/28');
CALL sp_instructores_create("Enrrique","Miguel","","Garcia","Pereida","15 av a lote 22 col el godoy","enrrique@kinal.edu","45336788",'1980/12/03');
CALL sp_instructores_create("Franklin","Armando","Daniel","Baten","Ramirez","14 av a lote 1 col cobihode","francklin@kinal.edu","11335577",'2000/06/05');
CALL sp_instructores_create("Esvin","Uriel","Sabdiel","Rossel","Tuna","19 av a lote 32 col las marias","esvin@kinal.edu","56789432",'2002/03/16');
CALL sp_instructores_create("Ervin","Antonio","","Hernandez","Gomez","13 av a lote 14 col santa fe","ervin@kinal.edu","09812367",'1991/07/15');
CALL sp_instructores_create("Angel","Gabriel","Tercero","Godoy","Felipe","11 av a lote 24 col los olivos","angel@kinal.edu","75849302",'1950/01/22');
CALL sp_instructores_create("Carlos","Andres","","Romero","Sanabria","22 av a lote 76 col ixhuacut","carlos@kinal.edu","16547890",'1982/12/29');
CALL sp_instructores_create("Kevin","Elias","Rodolfo","Pineda","Molina","25 av a lote 33 col xococ","kevin@kinal.edu","45465432",'1967/11/11');
CALL sp_instructores_create("Jhonatan","Antonio","","Sanum","Morales","12 av a lote 65 col las margaritas","jhon@kinal.edu","64321789",'2001/12/19');

-- ------call salones-------------------------------------------------------
CALL sp_salones_create("A1","Taller",20,"E5",2);
CALL sp_salones_create("A2","Calculo",15,"E2",3);
CALL sp_salones_create("A3","Social",10,"E3",1);
CALL sp_salones_create("A4","Ingles",15,"E5",3);
CALL sp_salones_create("A5","Lenguaje",15,"E1",3);
CALL sp_salones_create("A6","Matematicas",20,"E3",2);
CALL sp_salones_create("A7","Etica profecional",20,"E1",2);
CALL sp_salones_create("A8","Laboratorio",20,"E2",2);
CALL sp_salones_create("A9","Electromecanica",10,"E3",1);
CALL sp_salones_create("A10","Lab. Computadoras",15,"E4",3);

-- ----call carreras_tecnicas-----------------
CALL sp_carreras_tecnicas_create("IN5BM","Informatica","5to","B","Matutina");
CALL sp_carreras_tecnicas_create("ME5AV","Mecanica","5to","A","Vespertina");
CALL sp_carreras_tecnicas_create("DI5AM","Dibujo","5to","A","Matutina");
CALL sp_carreras_tecnicas_create("EL5BV","Electricidad","5to","B","Vespertina");
CALL sp_carreras_tecnicas_create("EA5BV","Electronica","5to","B","Vespertina");
CALL sp_carreras_tecnicas_create("MA5AM","Medicina","5to","A","Matutina");
CALL sp_carreras_tecnicas_create("FA5AM","Farmaceutica","5to","A","Matutina");
CALL sp_carreras_tecnicas_create("PS5AV","Psicologia","5to","A","Vespertina");
CALL sp_carreras_tecnicas_create("MU5BV","Musica","5to","B","Vespertina");
CALL sp_carreras_tecnicas_create("CO5CM","Contabilidad","5to","C","Matutina");

-- -----call horarios------------------------------
CALL sp_horarios_create('07:00:00','12:30:00',0,1,1,0,1);
CALL sp_horarios_create('07:00:00','12:30:00',1,1,1,1,1);
CALL sp_horarios_create('07:00:00','12:30:00',0,0,1,1,1);
CALL sp_horarios_create('07:00:00','12:30:00',1,0,0,1,1);
CALL sp_horarios_create('07:00:00','12:30:00',1,1,0,0,0);
CALL sp_horarios_create('07:00:00','12:30:00',0,1,0,1,0);
CALL sp_horarios_create('07:00:00','12:30:00',1,0,1,0,1);
CALL sp_horarios_create('07:00:00','12:30:00',1,0,0,1,1);
CALL sp_horarios_create('07:00:00','12:30:00',1,1,0,1,0);
CALL sp_horarios_create('07:00:00','12:30:00',0,1,0,0,1);

-- --------call cursos-----------------------------------------
CALL sp_cursos_create("matematicas",2022,20,10,"IN5BM",1,1,"A6");
CALL sp_cursos_create("lenguaje",2022,30,10,"ME5AV",2,2,"A5");
CALL sp_cursos_create("sociales",2022,15,10,"PS5AV",3,3,"A3");
CALL sp_cursos_create("ingles",2022,25,10,"EL5BV",4,4,"A4");
CALL sp_cursos_create("etica profesional",2022,15,10,"FA5AM",5,5,"A7");
CALL sp_cursos_create("quimica",2022,25,10,"CO5CM",6,6,"A9");
CALL sp_cursos_create("calculo",2022,20,10,"EA5BV",7,7,"A2");
CALL sp_cursos_create("dibujo",2022,30,10,"DI5AM",8,8,"A1");
CALL sp_cursos_create("musica",2022,15,10,"MU5BV",9,9,"A10");
CALL sp_cursos_create("estadistica",2022,20,10,"MA5AM",10,10,"A8");

-- --------call_asignaciones_alumnos-----------------------
CALL sp_asignaciones_alumnos_create("2021001",1,'2022-01-15 07:00');
CALL sp_asignaciones_alumnos_create("2021002",2,'2022-01-15 07:10');
CALL sp_asignaciones_alumnos_create("2021003",3,'2022-01-15 07:20');
CALL sp_asignaciones_alumnos_create("2021004",4,'2022-01-15 07:30');
CALL sp_asignaciones_alumnos_create("2021005",5,'2022-01-15 07:40');
CALL sp_asignaciones_alumnos_create("2021006",6,'2022-01-15 07:50');
CALL sp_asignaciones_alumnos_create("2021007",7,'2022-01-15 08:00');
CALL sp_asignaciones_alumnos_create("2021008",8,'2022-01-15 08:10');
CALL sp_asignaciones_alumnos_create("2021009",9,'2022-01-15 08:20');
CALL sp_asignaciones_alumnos_create("2021010",10,'2022-01-15 08:30');