create table usuarios (
	idUsuario int,
	constraint PK_usuarios primary key (idUsuario),
	mail varchar(100),
	nickname varchar(500),
	habilitado int,
	nombre varchar(100),
	avatar varchar(100),
	tipo_usuario int,
);

create table tipos (
	idTipo int,
	descripcion varchar(500),
	constraint PK_Tipos primary key(idTipo)
);


create table recetas (
	idReceta int,
	idUsuario int,
	nombre varchar(100),
	descripcion varchar(500),
	foto varchar(500),
	porciones int,
	cantidadPersonas int,
	idTipo int,
	constraint PK_Recetas primary key(idReceta),
	constraint FK_Recetas_Usuarios foreign key(idUsuario) references usuarios,
	constraint FK_Recetas_Tipos foreign key(idTipo) references tipos

);


create table pasos (
	idPaso int,
	idReceta int,
	nroPaso int,
	texto varchar(500),
	constraint PK_Pasos primary key(idPaso),
	constraint FK_Pasos_Recetas foreign key(idReceta) references recetas
);

create table multimedia (
	idContenido int,
	idPaso int,
	tipo_contenido int,
	extension varchar(50),
	urlContenido varchar(500),
	constraint PK_Multimedia primary key(idContenido),
	constraint FK_Multimedia_Pasos foreign key(idPaso) references pasos
);


create table calificaciones(
	idCalificacion int,
	idUsuario int,
	idReceta int,
	calificacion int,
	comentarios varchar(500),
	constraint PK_Calificaciones primary key(idCalificacion),
	constraint FK_Calificaciones_Recetas foreign key(idReceta) references recetas,
	constraint FK_Calificaciones_Usuarios foreign key(idUsuario) references usuarios
);


create table unidades(
	idUnidad int,
	descripcion varchar(500),
	constraint PK_Unidades primary key(idUnidad),
);


create table utilizados(
	idUtilizado int,
	idReceta int,
	idIngredientes int,
	cantidad int,
	idUnidad int,
	observaciones varchar(500),
	constraint PK_Utilizados primary key(idUtilizado),
	constraint FK_Utilizados_Unidades foreign key(idUnidad) references unidades,
);
