-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: bd_fruver
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `pkIdCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`pkIdCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `Personas_pkIdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(45) NOT NULL,
  `edad` int(11) NOT NULL,
  PRIMARY KEY (`Personas_pkIdPersona`),
  KEY `fk_Cliente_Personas1_idx` (`Personas_pkIdPersona`),
  CONSTRAINT `fk_Cliente_Personas1` FOREIGN KEY (`Personas_pkIdPersona`) REFERENCES `persona` (`pkIdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Masculino',56),(2,'Femenino',32),(3,'Masculino',28),(4,'Femenino',26),(5,'Femenino',19);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `Persona_pkIdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` int(11) NOT NULL,
  KEY `fk_Contacto_Persona1_idx` (`Persona_pkIdPersona`),
  CONSTRAINT `fk_Contacto_Persona1` FOREIGN KEY (`Persona_pkIdPersona`) REFERENCES `persona` (`pkIdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlpedidos`
--

DROP TABLE IF EXISTS `controlpedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlpedidos` (
  `idFactura` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `precioCompra` int(11) DEFAULT NULL,
  `ivaCompra` decimal(8,0) DEFAULT NULL,
  `cantidadProductoSolicitado` int(11) DEFAULT NULL,
  `nombreProductoSolicitado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlpedidos`
--

LOCK TABLES `controlpedidos` WRITE;
/*!40000 ALTER TABLE `controlpedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlpedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `nameDocumento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (1,'CC'),(2,'Nit'),(3,'CE'),(4,'PS'),(5,'TI');
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `pkIdFactura` int(11) NOT NULL,
  `Cliente_Personas_pkIdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `fechaFactura` date DEFAULT NULL,
  `subTotal` int(11) DEFAULT NULL,
  `ivaFactura` int(11) DEFAULT NULL,
  `valorFactura` int(11) DEFAULT NULL,
  `cantidadProductoVendido` int(11) DEFAULT NULL,
  PRIMARY KEY (`pkIdFactura`),
  KEY `fk_Factura_Cliente1_idx` (`Cliente_Personas_pkIdPersona`),
  CONSTRAINT `fk_Factura_Cliente1` FOREIGN KEY (`Cliente_Personas_pkIdPersona`) REFERENCES `cliente` (`Personas_pkIdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordendecompraproducto`
--

DROP TABLE IF EXISTS `ordendecompraproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordendecompraproducto` (
  `OrdenDeCompra_idFactura` int(11) DEFAULT NULL,
  `Producto_pkIdProducto` int(11) DEFAULT NULL,
  KEY `fk_OrdenDeCompra_has_Producto_Producto1_idx` (`Producto_pkIdProducto`),
  KEY `fk_OrdenDeCompra_has_Producto_OrdenDeCompra1_idx` (`OrdenDeCompra_idFactura`),
  CONSTRAINT `fk_OrdenDeCompra_has_Producto_OrdenDeCompra1` FOREIGN KEY (`OrdenDeCompra_idFactura`) REFERENCES `controlpedidos` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenDeCompra_has_Producto_Producto1` FOREIGN KEY (`Producto_pkIdProducto`) REFERENCES `producto` (`pkIdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordendecompraproducto`
--

LOCK TABLES `ordendecompraproducto` WRITE;
/*!40000 ALTER TABLE `ordendecompraproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordendecompraproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `pkIdPermisos` int(11) NOT NULL,
  `nombrePermiso` varchar(45) NOT NULL,
  PRIMARY KEY (`pkIdPermisos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'Creacion Proveedor'),(2,'Acceso Ventas'),(3,'Acceso Bodega'),(4,'Creacion Cliente'),(5,'Creacion Usuario');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisosrol`
--

DROP TABLE IF EXISTS `permisosrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisosrol` (
  `Rol_pkIdRol` int(11) NOT NULL,
  `Permiso_pkIdPermisos` int(11) NOT NULL,
  KEY `fk_PermisosRol_Rol1_idx` (`Rol_pkIdRol`),
  KEY `fk_PermisosRol_Permiso1_idx` (`Permiso_pkIdPermisos`),
  CONSTRAINT `fk_permisos` FOREIGN KEY (`Permiso_pkIdPermisos`) REFERENCES `permiso` (`pkIdPermisos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles` FOREIGN KEY (`Rol_pkIdRol`) REFERENCES `rol` (`pkIdRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisosrol`
--

LOCK TABLES `permisosrol` WRITE;
/*!40000 ALTER TABLE `permisosrol` DISABLE KEYS */;
INSERT INTO `permisosrol` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,3),(4,2),(4,4),(5,2),(5,4);
/*!40000 ALTER TABLE `permisosrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `pkIdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `fkIdDocumento` int(20) DEFAULT NULL,
  `nombre` varchar(70) DEFAULT NULL,
  `apellido` varchar(120) DEFAULT NULL,
  `correoElectronico` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pkIdPersona`),
  KEY `idDocumento_idx` (`fkIdDocumento`),
  CONSTRAINT `idDocumento` FOREIGN KEY (`fkIdDocumento`) REFERENCES `documento` (`idTipoDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,1,'pepe','Cardona','pf@gmail.com'),(2,1,'Monica','perez','lp@gmail.com'),(3,1,'javier','hernandez','jh@gmail.com'),(4,1,'Andrea','triana','gt@gmail.com'),(5,1,'liseth','rojas','lr@gmail.com'),(6,1,'Oscar','Fuentes','of@gmail.com'),(7,2,'juan','herrera','juan@gmail.com'),(8,2,'david','suarez','davids@gmail.com'),(9,2,'santiago','rico','santi@gmail.com'),(10,2,'jose','jimenez','jj@gmail.com'),(11,1,'Pepito','Juarez','pepejue@gmail.com'),(12,2,'martha','mariño','cordi@gmail.com'),(13,1,'arley','Guerrero','ag@gmail.com'),(14,1,'Luis','Velazquez','lv@gmail.com'),(15,1,'Gisel','Peña','gp@gmail.com');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `pkIdProducto` int(11) NOT NULL,
  `Categoria_pkIdCategoria` int(11) DEFAULT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `caducidad` date NOT NULL,
  `cantidadProducto` int(11) NOT NULL,
  `PrecioVenta` int(11) NOT NULL,
  `ivaProducto` decimal(15,0) NOT NULL,
  PRIMARY KEY (`pkIdProducto`),
  KEY `fk_Producto_Categoria1_idx` (`Categoria_pkIdCategoria`),
  CONSTRAINT `fk_Producto_Categoria1` FOREIGN KEY (`Categoria_pkIdCategoria`) REFERENCES `categoria` (`pkIdCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productofactura`
--

DROP TABLE IF EXISTS `productofactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productofactura` (
  `Producto_pkIdProducto` int(11) DEFAULT NULL,
  `Factura_pkIdFactura` int(11) DEFAULT NULL,
  KEY `fk_Producto_has_Factura_Factura1_idx` (`Factura_pkIdFactura`),
  KEY `fk_Producto_has_Factura_Producto1_idx` (`Producto_pkIdProducto`),
  CONSTRAINT `fk_Producto_has_Factura_Factura1` FOREIGN KEY (`Factura_pkIdFactura`) REFERENCES `factura` (`pkIdFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Factura_Producto1` FOREIGN KEY (`Producto_pkIdProducto`) REFERENCES `producto` (`pkIdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productofactura`
--

LOCK TABLES `productofactura` WRITE;
/*!40000 ALTER TABLE `productofactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `productofactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `Persona_pkIdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `tipoProducto` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`Persona_pkIdPersona`),
  CONSTRAINT `fk_Proveedor_Persona1` FOREIGN KEY (`Persona_pkIdPersona`) REFERENCES `persona` (`pkIdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (7,'granos','calle33#25-23'),(8,'vegetales','carrera46 #31-56'),(9,'dulces','diagonal 58 #21-12'),(10,'azucares','calle21 sur# 47-3'),(12,'carnes','carrera 14 # 12-31');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedorproducto`
--

DROP TABLE IF EXISTS `proveedorproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedorproducto` (
  `Proveedor_Persona_pkIdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Producto_pkIdProducto` int(11) DEFAULT NULL,
  KEY `fk_Proveedor_has_Producto_Producto1_idx` (`Producto_pkIdProducto`),
  KEY `fk_Proveedor_has_Producto_Proveedor1_idx` (`Proveedor_Persona_pkIdPersona`),
  CONSTRAINT `fk_Proveedor_has_Producto_Producto1` FOREIGN KEY (`Producto_pkIdProducto`) REFERENCES `producto` (`pkIdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedor_has_Producto_Proveedor1` FOREIGN KEY (`Proveedor_Persona_pkIdPersona`) REFERENCES `proveedor` (`Persona_pkIdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedorproducto`
--

LOCK TABLES `proveedorproducto` WRITE;
/*!40000 ALTER TABLE `proveedorproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedorproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `pkIdRol` int(11) NOT NULL,
  `nombreRol` varchar(45) NOT NULL,
  PRIMARY KEY (`pkIdRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Gerente'),(2,'Administrador'),(3,'Logistica'),(4,'Cajero Carnes'),(5,'Cajero Principal');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajador` (
  `Personas_pkIdPersona` int(11) NOT NULL,
  `fechaContratacion` date NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Cargo` varchar(45) NOT NULL,
  `EPS` varchar(45) NOT NULL,
  PRIMARY KEY (`Personas_pkIdPersona`),
  CONSTRAINT `fk_trabajador_Personas1` FOREIGN KEY (`Personas_pkIdPersona`) REFERENCES `persona` (`pkIdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (6,'2010-03-12','Calle 41 sur #52-6','Cajero','Salud Total'),(11,'2013-08-15','Carrera 72 # 60-12','Cajero carnes','Sanitas'),(13,'2010-01-28','Carrera 85 # 6 - 8','Administrador','Sura'),(14,'2016-04-19','Calle 49 sur # 80-4','Gerente','Nueva eps'),(15,'2011-06-02','Carrera 22 sur # 21-2','Logistica','Famisanar');
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `trabajador_Personas_pkIdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Rol_pkIdRol` int(11) DEFAULT NULL,
  `nombreUsuario` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  PRIMARY KEY (`trabajador_Personas_pkIdPersona`),
  KEY `fk_Usuario_Rol1_idx` (`Rol_pkIdRol`),
  CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Rol_pkIdRol`) REFERENCES `rol` (`pkIdRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_trabajador1` FOREIGN KEY (`trabajador_Personas_pkIdPersona`) REFERENCES `trabajador` (`Personas_pkIdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (6,5,'Cajero Principal','pC54321'),(11,4,'Cajero Carnes','cC54321'),(13,1,'Administrador','aDm54321'),(14,2,'Gerente','rG9876'),(15,3,'Logistica','gL9876');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-16 20:55:31
