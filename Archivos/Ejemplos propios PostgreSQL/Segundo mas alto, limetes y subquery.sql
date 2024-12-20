SELECT DISTINCT colegiatura
FROM platzi.alumnos AS a1
WHERE 2 = (
	SELECT COUNT (DISTINCT colegiatura)
	FROM platzi.alumnos as a2
	WHERE a1.colegiatura <= a2.colegiatura
);

SELECT DISTINCT colegiatura
FROM platzi.alumnos
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;

SELECT DISTINCT colegiatura, tutor_id
FROM platzi.alumnos
WHERE tutor_id = 8
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;

SELECT *
FROM platzi.alumnos AS datos_alumnos
INNER JOIN (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura
;

SELECT *
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
);

SELECT *
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
)FETCH FIRST 15 ROW ONLY;

SELECT  *
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 1 
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
)LIMIT 15 ;

SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos
OFFSET (
	SELECT COUNT(*) /2
	FROM platzi.alumnos
);