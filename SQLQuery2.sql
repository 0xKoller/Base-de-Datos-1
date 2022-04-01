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
	constraint FK_Recetas_Usuarios foreign key(idUsuario) references usuarios
);

