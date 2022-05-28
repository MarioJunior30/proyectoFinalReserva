CREATE DATABASE bd_complejo_deportivo;

USE bd_complejo_deportivo;

CREATE TABLE `dep_estado` (
  `CODESTADO` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `TXTESTADO` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `COLUMN1` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `COLUMN2` date NOT NULL,
  `CODUSUARIOMOD` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECMOD` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dep_estado`
--

INSERT INTO `dep_estado` (`CODESTADO`, `TXTESTADO`, `COLUMN1`, `COLUMN2`, `CODUSUARIOMOD`, `FECMOD`) VALUES
('01', 'ACTIVO', '', '0000-00-00', '', '0000-00-00'),
('02', 'INACTIVO', '', '0000-00-00', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dep_horario`
--

CREATE TABLE `dep_horario` (
  `CODHORARIO` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `CODZONAGIMNASIO` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `NUMHORAINICIO` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `NUMHORAFIN` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `CODESTADO` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `CODUSUARIOREG` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECREG` date NOT NULL,
  `CODUSUARIOMOD` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECMOD` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dep_horario`
--

INSERT INTO `dep_horario` (`CODHORARIO`, `CODZONAGIMNASIO`, `NUMHORAINICIO`, `NUMHORAFIN`, `CODESTADO`, `CODUSUARIOREG`, `FECREG`, `CODUSUARIOMOD`, `FECMOD`) VALUES
('000000001', '01', '07:00', '08:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000002', '01', '09:00', '10:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000003', '02', '07:00', '08:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000004', '02', '09:00', '10:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000005', '03', '08:00', '09:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000006', '03', '11:00', '12:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000007', '04', '07:00', '08:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000008', '04', '09:00', '10:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000009', '05', '07:00', '08:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000010', '05', '09:00', '10:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000011', '06', '07:00', '08:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000012', '06', '10:00', '11:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000013', '06', '17:00', '18:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000013', '07', '07:00', '08:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000014', '07', '08:00', '09:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000015', '07', '09:00', '10:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000016', '07', '10:00', '11:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000017', '07', '11:00', '12:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000018', '07', '12:00', '13:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000019', '07', '13:00', '14:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000020', '07', '14:00', '15:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000021', '07', '15:00', '16:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000022', '07', '16:00', '17:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('000000023', '07', '17:00', '18:00', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dep_lugarreserva`
--

CREATE TABLE `dep_lugarreserva` (
  `CODLUGARRESERVA` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `TXTLUGARRESERVA` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `CODESTADO` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `CODUSUARIOREG` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECREG` date NOT NULL,
  `CODUSUARIOMOD` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECMOD` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dep_lugarreserva`
--

INSERT INTO `dep_lugarreserva` (`CODLUGARRESERVA`, `TXTLUGARRESERVA`, `CODESTADO`, `CODUSUARIOREG`, `FECREG`, `CODUSUARIOMOD`, `FECMOD`) VALUES
('01', 'COMPLEJO DEPORTIVO', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('02', 'PLAZA 31', '01', 'GRUPAY', '2022-05-27', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dep_reserva`
--

CREATE TABLE `dep_reserva` (
  `CODRESERVA` int(11) NOT NULL,
  `CODUSUARIO` int(11) NOT NULL,
  `CODZONAGIMNASIO` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `CODLUGARRESERVA` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `FECRESERVA` date NOT NULL,
  `NUMHORAINICIO` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `NUMHORAFIN` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `CODESTADO` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `CODUSUARIOREG` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECREG` date NOT NULL,
  `CODUSUARIOMOD` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECMOD` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dep_tipodocumento`
--

CREATE TABLE `dep_tipodocumento` (
  `CODTIPODOCUMENTO` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `TXTTIPODOCUMENTO` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `GLOSA` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `CODESTADO` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `CODUSUARIOREG` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECREG` date NOT NULL,
  `CODUSUARIOMOD` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECMOD` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dep_tipodocumento`
--

INSERT INTO `dep_tipodocumento` (`CODTIPODOCUMENTO`, `TXTTIPODOCUMENTO`, `GLOSA`, `CODESTADO`, `CODUSUARIOREG`, `FECREG`, `CODUSUARIOMOD`, `FECMOD`) VALUES
('CE', 'Carnet Extranjeria', '', '', '', '0000-00-00', '', '0000-00-00'),
('DNI', 'DNI', '', '', '', '0000-00-00', '', '0000-00-00'),
('PS', 'Pasaporte', '', '', '', '0000-00-00', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dep_tipousuario`
--

CREATE TABLE `dep_tipousuario` (
  `CODTIPOUSUARIO` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `TXTTIPOUSUARIO` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `CODUSUARIOREG` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECREG` date NOT NULL,
  `CODUSUARIOMOD` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECMOD` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dep_tipousuario`
--

INSERT INTO `dep_tipousuario` (`CODTIPOUSUARIO`, `TXTTIPOUSUARIO`, `CODUSUARIOREG`, `FECREG`, `CODUSUARIOMOD`, `FECMOD`) VALUES
('1', 'VECINOS', 'GRUPAY', '2022-05-27', '', '0000-00-00'),
('2', 'ADMINISTRADOR', 'GRUPAY', '2022-05-27', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dep_usuario`
--

CREATE TABLE `dep_usuario` (
  `CODUSUARIO` int(11) NOT NULL,
  `CODTIPODOCUMENTO` varchar(3) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `NUMDOCUMENTO` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `TXTNOMBRE` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `TXTAPEPATERNO` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `TXTAPEMATERNO` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `TXTCORREO` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `TXTCELULAR` varchar(9) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `TXTPASSWORD` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `CODTIPOUSUARIO` varchar(2) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `CODUSUARIOREG` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `FECREG` date DEFAULT NULL,
  `CODUSUARIOMOD` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `FECMOD` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dep_usuario`
--

INSERT INTO `dep_usuario` (`CODUSUARIO`, `CODTIPODOCUMENTO`, `NUMDOCUMENTO`, `TXTNOMBRE`, `TXTAPEPATERNO`, `TXTAPEMATERNO`, `TXTCORREO`, `TXTCELULAR`, `TXTPASSWORD`, `CODTIPOUSUARIO`, `CODUSUARIOREG`, `FECREG`, `CODUSUARIOMOD`, `FECMOD`) VALUES
(1, 'DNI', '46912937', 'Jair Alejandro', 'Vasquez', 'Espinoza', 'jair1624@gmail.com', '991788382', '12345', NULL, NULL, NULL, NULL, NULL);

INSERT INTO `dep_usuario` (`CODUSUARIO`, `CODTIPODOCUMENTO`, `NUMDOCUMENTO`, `TXTNOMBRE`, `TXTAPEPATERNO`, `TXTAPEMATERNO`, `TXTCORREO`, `TXTCELULAR`, `TXTPASSWORD`, `CODTIPOUSUARIO`, `CODUSUARIOREG`, `FECREG`, `CODUSUARIOMOD`, `FECMOD`) VALUES
(3, 'DNI', '70030215', 'Diego', 'Huamani', 'Bueno', 'diegohb433@gmail.com', '985050119', '12345', NULL, NULL, NULL, NULL, NULL);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dep_zonagimnasio`
--

CREATE TABLE `dep_zonagimnasio` (
  `CODZONAGIMNASIO` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `TXTZONAGIMNASIO` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `NUMRESERVAS` int(11) NOT NULL,
  `CODESTADO` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `CODLUGARRESERVA` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `CODUSUARIOREG` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `FECREG` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dep_zonagimnasio`
--

INSERT INTO `dep_zonagimnasio` (`CODZONAGIMNASIO`, `TXTZONAGIMNASIO`, `NUMRESERVAS`, `CODESTADO`, `CODLUGARRESERVA`, `CODUSUARIOREG`, `FECREG`) VALUES
('01', 'CICLYNG', 10, '01', '01', 'GRUPAY', '2022-05-27'),
('02', 'ZUMBA', 15, '01', '01', 'GRUPAY', '2022-05-27'),
('03', 'TAE BO', 10, '01', '02', 'GRUPAY', '2022-05-27'),
('04', 'BAILE', 15, '01', '02', 'GRUPAY', '2022-05-27'),
('05', 'PILATES', 8, '01', '01', 'GRUPAY', '2022-05-27'),
('06', 'FUNCIONAL', 9, '01', '01', 'GRUPAY', '2022-05-27'),
('07', 'ZONA MAQUINAS', 15, '01', '02', 'GRUPAY', '2022-05-27');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dep_estado`
--
ALTER TABLE `dep_estado`
  ADD PRIMARY KEY (`CODESTADO`);

--
-- Indices de la tabla `dep_horario`
--
ALTER TABLE `dep_horario`
  ADD PRIMARY KEY (`CODHORARIO`,`CODZONAGIMNASIO`) USING BTREE,
  ADD KEY `DEP_CODZONAGIMHORARIO_FK` (`CODZONAGIMNASIO`);

--
-- Indices de la tabla `dep_lugarreserva`
--
ALTER TABLE `dep_lugarreserva`
  ADD PRIMARY KEY (`CODLUGARRESERVA`);

--
-- Indices de la tabla `dep_reserva`
--
ALTER TABLE `dep_reserva`
  ADD PRIMARY KEY (`CODRESERVA`),
  ADD KEY `DEP_CODZONAGIMNASIO_FK` (`CODZONAGIMNASIO`),
  ADD KEY `DEP_CODUSUARIO_FK` (`CODUSUARIO`);

--
-- Indices de la tabla `dep_tipodocumento`
--
ALTER TABLE `dep_tipodocumento`
  ADD PRIMARY KEY (`CODTIPODOCUMENTO`);

--
-- Indices de la tabla `dep_tipousuario`
--
ALTER TABLE `dep_tipousuario`
  ADD PRIMARY KEY (`CODTIPOUSUARIO`);

--
-- Indices de la tabla `dep_usuario`
--
ALTER TABLE `dep_usuario`
  ADD PRIMARY KEY (`CODUSUARIO`),
  ADD KEY `DEP_CODTIPOUSUARIO_FK` (`CODTIPOUSUARIO`),
  ADD KEY `DEP_USUARIOTIPODOCUMENTO_FK` (`CODTIPODOCUMENTO`);

--
-- Indices de la tabla `dep_zonagimnasio`
--
ALTER TABLE `dep_zonagimnasio`
  ADD PRIMARY KEY (`CODZONAGIMNASIO`),
  ADD KEY `DEP_CODLUGARRESERVA_FK` (`CODLUGARRESERVA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dep_reserva`
--
ALTER TABLE `dep_reserva`
  MODIFY `CODRESERVA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dep_usuario`
--
ALTER TABLE `dep_usuario`
  MODIFY `CODUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dep_horario`
--
ALTER TABLE `dep_horario`
  ADD CONSTRAINT `DEP_CODZONAGIMHORARIO_FK` FOREIGN KEY (`CODZONAGIMNASIO`) REFERENCES `dep_zonagimnasio` (`CODZONAGIMNASIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `dep_reserva`
--
ALTER TABLE `dep_reserva`
  ADD CONSTRAINT `DEP_CODZONAGIMNASIO_FK` FOREIGN KEY (`CODZONAGIMNASIO`) REFERENCES `dep_zonagimnasio` (`CODZONAGIMNASIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `dep_usuario`
--
ALTER TABLE `dep_usuario`
  ADD CONSTRAINT `DEP_CODTIPOUSUARIO_FK` FOREIGN KEY (`CODTIPOUSUARIO`) REFERENCES `dep_tipousuario` (`CODTIPOUSUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `dep_zonagimnasio`
--
ALTER TABLE `dep_zonagimnasio`
  ADD CONSTRAINT `DEP_CODLUGARRESERVA_FK` FOREIGN KEY (`CODLUGARRESERVA`) REFERENCES `dep_lugarreserva` (`CODLUGARRESERVA`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;



INSERT INTO `dep_reserva` (`CODRESERVA`,`CODUSUARIO`,`CODZONAGIMNASIO`,`CODLUGARRESERVA`,`FECRESERVA`,`NUMHORAINICIO`,`NUMHORAFIN`,`CODESTADO`,`CODUSUARIOREG`,`FECREG`,`CODUSUARIOMOD`,`FECMOD`) VALUES
(1,'3','01','01','2022-05-26','08:00','09:00','A','DHB','2022-05-27','DHB','2022-05-27');


CREATE VIEW LISTAR_RESERVA AS
select
t.TXTTIPODOCUMENTO,
CONCAT(u.TXTNOMBRE,' ',u.TXTAPEMATERNO,' ',u.TXTAPEPATERNO)AS NOMBRE,
l.TXTLUGARRESERVA,
z.TXTZONAGIMNASIO,
r.FECRESERVA,
CONCAT(r.NUMHORAINICIO,'-',r.NUMHORAFIN) AS HORA
from
dep_reserva r,
dep_usuario u,
dep_tipodocumento t,
dep_lugarreserva l,
dep_zonagimnasio z
where
r.CODUSUARIO=u.CODUSUARIO AND
t.CODTIPODOCUMENTO=u.CODTIPODOCUMENTO AND
l.CODLUGARRESERVA = r.CODLUGARRESERVA AND
z.CODZONAGIMNASIO = r.CODZONAGIMNASIO