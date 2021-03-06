-- MySQL Script generated by MySQL Workbench
-- Wed Nov 20 19:58:30 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd_fruver
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_fruver
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_fruver` DEFAULT CHARACTER SET utf8 ;
USE `bd_fruver` ;

-- -----------------------------------------------------
-- Table `bd_fruver`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`categoria` (
  `pkIdCategoria` INT(11) NOT NULL COMMENT 'Este atributo es el identificador y llave primaria de la tabla, dato unico e irrepetible y no admite datos nulos.',
  `nombreCategoria` VARCHAR(45) NOT NULL COMMENT 'Este atributo almacena los datos que representan los nombres de las categorias de cada producto y no admite datos nulos.',
  PRIMARY KEY (`pkIdCategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'La presente tabla almacena los datos de nombre de la categoria y los identifica con un ID unico.';


-- -----------------------------------------------------
-- Table `bd_fruver`.`documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`documento` (
  `idTipoDocumento` INT(11) NOT NULL COMMENT 'Este atributo es la llave primaria, por lo cual es irrepetible y obligatorio. Este almacena el dato de identificador de la tabla y es de tipo entero',
  `nameDocumento` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Este atributo almacena el dato que se designa a la descripcion del documento.',
  PRIMARY KEY (`idTipoDocumento`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COMMENT = 'En la presente tabla se tiene un Id como identificador, este es la llave primaria. tambien se encuentra el nombre del documento para la descripcion del documento';


-- -----------------------------------------------------
-- Table `bd_fruver`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`persona` (
  `pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT,
  `fkIdDocumento` INT(20) NULL DEFAULT NULL,
  `nombre` VARCHAR(70) NULL DEFAULT NULL,
  `apellido` VARCHAR(120) NULL DEFAULT NULL,
  `correoElectronico` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`pkIdPersona`),
  INDEX `idDocumento_idx` (`fkIdDocumento` ASC) VISIBLE,
  CONSTRAINT `idDocumento`
    FOREIGN KEY (`fkIdDocumento`)
    REFERENCES `bd_fruver`.`documento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_fruver`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`cliente` (
  `Personas_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Este atributo identificado como llave primaria proviene de la tabla personas la cual ha sido heredado y llama a los datos que identifican a la tabla mencionada anteriormente. ',
  `genero` VARCHAR(45) NOT NULL COMMENT 'Dato que especifica si el cliente es del genero masculino, femenino, o si prefiere no decir, no se permiten datos nulos. ',
  `edad` INT(11) NOT NULL COMMENT 'Dentro de este atributo se guarda el dato de la edad de un cliente para estadisticas posteriores, este es obligatorio para la recoleccion de informacion del cliente.',
  PRIMARY KEY (`Personas_pkIdPersona`),
  INDEX `fk_Cliente_Personas1_idx` (`Personas_pkIdPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Personas1`
    FOREIGN KEY (`Personas_pkIdPersona`)
    REFERENCES `bd_fruver`.`persona` (`pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COMMENT = 'La presente tabla almacena los datos que tendra especificamente el cliente, los cuales son el genero y la edad, que estara identificado por un id, unico e irrepetible. ';


-- -----------------------------------------------------
-- Table `bd_fruver`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`contacto` (
  `Persona_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Este atributo, indica el id de la persona. Se encuentra como llave foranea para aplicar varios datos telefonicos si se considera pertinente.',
  `telefono` INT(11) NOT NULL COMMENT 'Dentro de este atributo se almacena el numero telefonico de la persona. Es un dato obligatorio en primera instancia y se guarda solamente en entero.',
  INDEX `fk_Contacto_Persona1_idx` (`Persona_pkIdPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Contacto_Persona1`
    FOREIGN KEY (`Persona_pkIdPersona`)
    REFERENCES `bd_fruver`.`persona` (`pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8
COMMENT = 'En la presente tabla se almacena el numero de contacto para la persona existente en el sistema, por ello se usa la llave foranea persona (la identidad) para agregar mas datos si se considera pertinente. ';


-- -----------------------------------------------------
-- Table `bd_fruver`.`controlpedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`controlpedidos` (
  `idFacturaPedido` INT(11) NOT NULL COMMENT 'Este atributo, representa el identificador del pedido. Este es un dato unico e irrepetible dentro de la tabla y es de caracter obligatorio.',
  `fecha` DATE NULL DEFAULT NULL COMMENT 'Este atributo almacena los datos referentes a la fecha que se solicita el pedido. Este se caracteriza por ser de tipo \"fecha\" para el manejo de tal formato.',
  `precioCompra` INT(11) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes al precio de compra general de los productos que se soliciten. Este es de tipo entero para permitir solamente datos numericos.',
  `ivaCompra` DECIMAL(8,0) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes al iva de la compra general. Este es de tipo decimal para permitir el manejo de datos decimales.',
  `cantidadProductoSolicitado` INT(11) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes a la cantidad del producto requerido. Esta es de tipo entero puesto que solamente permite datos numericos.',
  `nombreProductoSolicitado` VARCHAR(45) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes al nombre del producto solicitado. Esta es de tipo Varchar para permitir datos alfa-numericos.',
  PRIMARY KEY (`idFacturaPedido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'La presente tabla se encuentra identificada bajo un ID de llave primaria para el control de pedidos al proveedor. Esta conformado por fecha del pedido, precio e iva de la compra, nombre del producto y cantidad requerida.';


-- -----------------------------------------------------
-- Table `bd_fruver`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`factura` (
  `pkIdFactura` INT(11) NOT NULL COMMENT 'Este atributo, indica el id de la factura. Se encuentra como llave primaria para la identidad de la factura. Este es de tipo entero y no nulo.',
  `Cliente_Personas_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'jsbdflugher9uf',
  `fechaFactura` DATE NULL DEFAULT NULL,
  `subTotal` INT(11) NULL DEFAULT NULL,
  `ivaFactura` INT(11) NULL DEFAULT NULL,
  `valorFactura` INT(11) NULL DEFAULT NULL,
  `cantidadProductoVendido` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pkIdFactura`),
  INDEX `fk_Factura_Cliente1_idx` (`Cliente_Personas_pkIdPersona` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COMMENT = 'La presente tabla se identifica a partir de la llave primaria Id y almacena los datos de cliente, la fecha, subtotal, iva, total y la cantidad de los productos comprados';


-- -----------------------------------------------------
-- Table `bd_fruver`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`producto` (
  `pkIdProducto` INT(11) NOT NULL,
  `Categoria_pkIdCategoria` INT(11) NULL DEFAULT NULL,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `caducidad` DATE NOT NULL,
  `cantidadProducto` INT(11) NOT NULL,
  `PrecioVenta` INT(11) NOT NULL,
  `ivaProducto` DECIMAL(15,0) NOT NULL,
  PRIMARY KEY (`pkIdProducto`),
  INDEX `fk_Producto_Categoria1_idx` (`Categoria_pkIdCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Categoria1`
    FOREIGN KEY (`Categoria_pkIdCategoria`)
    REFERENCES `bd_fruver`.`categoria` (`pkIdCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_fruver`.`ordendecompraproducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`ordendecompraproducto` (
  `OrdenDeCompra_idFactura` INT(11) NULL DEFAULT NULL,
  `Producto_pkIdProducto` INT(11) NULL DEFAULT NULL,
  INDEX `fk_OrdenDeCompra_has_Producto_Producto1_idx` (`Producto_pkIdProducto` ASC) VISIBLE,
  INDEX `fk_OrdenDeCompra_has_Producto_OrdenDeCompra1_idx` (`OrdenDeCompra_idFactura` ASC) VISIBLE,
  CONSTRAINT `fk_OrdenDeCompra_has_Producto_OrdenDeCompra1`
    FOREIGN KEY (`OrdenDeCompra_idFactura`)
    REFERENCES `bd_fruver`.`controlpedidos` (`idFacturaPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenDeCompra_has_Producto_Producto1`
    FOREIGN KEY (`Producto_pkIdProducto`)
    REFERENCES `bd_fruver`.`producto` (`pkIdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_fruver`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`permiso` (
  `pkIdPermisos` INT(11) NOT NULL,
  `nombrePermiso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pkIdPermisos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_fruver`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`rol` (
  `pkIdRol` INT(11) NOT NULL,
  `nombreRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pkIdRol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_fruver`.`permisosrol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`permisosrol` (
  `Rol_pkIdRol` INT(11) NOT NULL,
  `Permiso_pkIdPermisos` INT(11) NOT NULL,
  INDEX `fk_PermisosRol_Rol1_idx` (`Rol_pkIdRol` ASC) VISIBLE,
  INDEX `fk_PermisosRol_Permiso1_idx` (`Permiso_pkIdPermisos` ASC) VISIBLE,
  CONSTRAINT `fk_permisos`
    FOREIGN KEY (`Permiso_pkIdPermisos`)
    REFERENCES `bd_fruver`.`permiso` (`pkIdPermisos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles`
    FOREIGN KEY (`Rol_pkIdRol`)
    REFERENCES `bd_fruver`.`rol` (`pkIdRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_fruver`.`productofactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`productofactura` (
  `Factura_pkIdFactura` INT(11) NOT NULL,
  `Producto_pkIdProducto` INT(11) NOT NULL,
  INDEX `fk_Producto_has_Factura_Factura1_idx` (`Factura_pkIdFactura` ASC) VISIBLE,
  INDEX `fk_Producto_has_Factura_Producto1_idx` (`Producto_pkIdProducto` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_has_Factura_Factura1`
    FOREIGN KEY (`Factura_pkIdFactura`)
    REFERENCES `bd_fruver`.`factura` (`pkIdFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Factura_Producto1`
    FOREIGN KEY (`Producto_pkIdProducto`)
    REFERENCES `bd_fruver`.`producto` (`pkIdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_fruver`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`proveedor` (
  `Persona_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT,
  `tipoProducto` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Persona_pkIdPersona`),
  CONSTRAINT `fk_Proveedor_Persona1`
    FOREIGN KEY (`Persona_pkIdPersona`)
    REFERENCES `bd_fruver`.`persona` (`pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_fruver`.`proveedorproducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`proveedorproducto` (
  `Proveedor_Persona_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT,
  `Producto_pkIdProducto` INT(11) NULL DEFAULT NULL,
  INDEX `fk_Proveedor_has_Producto_Producto1_idx` (`Producto_pkIdProducto` ASC) VISIBLE,
  INDEX `fk_Proveedor_has_Producto_Proveedor1_idx` (`Proveedor_Persona_pkIdPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedor_has_Producto_Producto1`
    FOREIGN KEY (`Producto_pkIdProducto`)
    REFERENCES `bd_fruver`.`producto` (`pkIdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedor_has_Producto_Proveedor1`
    FOREIGN KEY (`Proveedor_Persona_pkIdPersona`)
    REFERENCES `bd_fruver`.`proveedor` (`Persona_pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_fruver`.`trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`trabajador` (
  `Personas_pkIdPersona` INT(11) NOT NULL,
  `fechaContratacion` DATE NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Cargo` VARCHAR(45) NOT NULL,
  `EPS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Personas_pkIdPersona`),
  CONSTRAINT `fk_trabajador_Personas1`
    FOREIGN KEY (`Personas_pkIdPersona`)
    REFERENCES `bd_fruver`.`persona` (`pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_fruver`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_fruver`.`usuario` (
  `trabajador_Personas_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT,
  `Rol_pkIdRol` INT(11) NULL DEFAULT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`trabajador_Personas_pkIdPersona`),
  INDEX `fk_Usuario_Rol1_idx` (`Rol_pkIdRol` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Rol1`
    FOREIGN KEY (`Rol_pkIdRol`)
    REFERENCES `bd_fruver`.`rol` (`pkIdRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_trabajador1`
    FOREIGN KEY (`trabajador_Personas_pkIdPersona`)
    REFERENCES `bd_fruver`.`trabajador` (`Personas_pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
