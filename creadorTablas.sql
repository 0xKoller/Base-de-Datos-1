CREATE TABLE usuarios (
	idUsuario int,
	mail varchar(100),
	nickname varchar(50), 
	habilitado int,
	nombre varchar(50),
	tipo_usuario int,
	constraint pk_usuarios primary key (idUsuario)
);

CREATE TABLE tipos(
	idTipo int,
	descripcion varchar(500),
	constraint pk_tipos primary key (idTipo),
);


CREATE TABLE recetas(
	idReceta int,
	idUsuario int,
	idTipo int,
	nombre varchar(50),
	descripcion varchar(500), 
	foto varchar(500),
	porciones int,
	cantidadpersonas int,
	constraint pk_recetas primary key (idreceta),
	constraint fk_recetas_usuarios foreign key (idUsuario) references usuarios,
	constraint fk_recetas_tipos foreign key (idtipo) references tipos,
);



create table pasos(
	idPasos int,
	idReceta int,
	nroPaso int,
	texto varchar(500),
	constraint pk_pasos primary key (idPasos),
	constraint fk_pasos_recetas foreign key (idReceta) references recetas
);



create table multimedia(
	idContenido int,
	idPaso int,
	tipo_contenido varchar(50),
	extension varchar(50),
	urlcontenido varchar(100),
	constraint pk_multimedia primary key (idContenido),
	constraint fk_multimedia_pasos foreign key (idPaso) references recetas
);


create table calificaciones(
	idCalificacion int, 
	idUsuario int,
	idReceta int,
	calificacion float,
	comentarios varchar(200),
	constraint pk_calificaciones primary key (idcalificacion),
	constraint fk_calificaciones_usuarios foreign key (idUsuario) references usuarios,
	constraint fk_calificaciones_recetas foreign key (idreceta) references recetas, 
);


create table unidades(
	idUnidad int, 
	descripcion varchar(100),
	constraint pk_unidades primary key (idUnidad)
);

create table conversiones(
	idConversion int, 
	idUnidadOrigen int,
	idUnidadDestino int,
	factorConversiones int,
	constraint pk_conversiones primary key (idconversion),
	constraint fk_conversiones_unidadesOrigen foreign key (idUnidadOrigen) references unidades,
	constraint fk_conversiones_unidadesDestino foreign key (idUnidadDestino) references unidades,

);

create table ingredientes(
	idIngrediente int, 
	nombre varchar(50),
	constraint pk_ingredientes primary key (idIngrediente)
);


create table utilizados(
	idUtilizado int, 
	idReceta int, 
	idIngrediente int,
	cantidad int,
	idUnidad int,
	observaciones varchar(100),
	constraint pk_utilizados primary key (idUtilizado),
	constraint fk_utilizados_recetas foreign key (idReceta) references recetas,
	constraint fk_utilizados_ingredientes foreign key (idIngrediente) references ingredientes, 
	constraint fk_utilizados_unidades foreign key (idUnidad) references unidades,

);

create table fotos(
	idFoto int,
	idReceta int,
	urlFoto varchar(100),
	extension varchar(10),
	constraint pk_fotos primary key (idFoto),
	constraint fk_fotos_recetas foreign key (idReceta) references recetas
);