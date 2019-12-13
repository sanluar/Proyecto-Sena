-- MySQL Script generated by MySQL Workbench
-- 12/03/19 17:19:59
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `pkIdCategoria` INT(11) NOT NULL COMMENT 'Este atributo es el identificador y llave primaria de la tabla, dato unico e irrepetible y no admite datos nulos.',
  `nombreCategoria` VARCHAR(45) NOT NULL COMMENT 'Este atributo almacena los datos que representan los nombres de las categorias de cada producto y no admite datos nulos.',
  PRIMARY KEY (`pkIdCategoria`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'La presente tabla almacena los datos de nombre de la categoria y los identifica con un ID unico.';


-- -----------------------------------------------------
-- Table `mydb`.`documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`documento` (
  `idTipoDocumento` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Este atributo es la llave primaria, por lo cual es irrepetible y obligatorio. Este almacena el dato de identificador de la tabla y es de tipo entero.',
  `nombreDocumento` VARCHAR(45) NULL COMMENT 'Este atributo almacena el dato que se designa a la descripcion del documento.',
  PRIMARY KEY (`idTipoDocumento`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COMMENT = 'En la presente tabla se tiene un Id como identificador, este es la llave primaria. tambien se encuentra el nombre del documento para la descripcion del documento';


-- -----------------------------------------------------
-- Table `mydb`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`persona` (
  `pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `fkIdDocumento` INT(20) NULL DEFAULT NULL COMMENT '',
  `nombre` VARCHAR(70) NULL DEFAULT NULL COMMENT '',
  `apellido` VARCHAR(120) NULL DEFAULT NULL COMMENT '',
  `correoElectronico` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`pkIdPersona`)  COMMENT '',
  INDEX `idDocumento_idx` (`fkIdDocumento` ASC)  COMMENT '',
  CONSTRAINT `idDocumento`
    FOREIGN KEY (`fkIdDocumento`)
    REFERENCES `mydb`.`documento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `Personas_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Este atributo identificado como llave primaria proviene de la tabla personas la cual ha sido heredado y llama a los datos que identifican a la tabla mencionada anteriormente. ',
  `genero` VARCHAR(45) NOT NULL COMMENT 'Dato que especifica si el cliente es del genero masculino, femenino, o si prefiere no decir, no se permiten datos nulos. ',
  `edad` INT(11) NOT NULL COMMENT 'Dentro de este atributo se guarda el dato de la edad de un cliente para estadisticas posteriores, este es obligatorio para la recoleccion de informacion del cliente.',
  PRIMARY KEY (`Personas_pkIdPersona`)  COMMENT '',
  INDEX `fk_Cliente_Personas1_idx` (`Personas_pkIdPersona` ASC)  COMMENT '',
  CONSTRAINT `fk_Cliente_Personas1`
    FOREIGN KEY (`Personas_pkIdPersona`)
    REFERENCES `mydb`.`persona` (`pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COMMENT = 'La presente tabla almacena los datos que tendra especificamente el cliente, los cuales son el genero y la edad, que estara identificado por un id, unico e irrepetible. ';


-- -----------------------------------------------------
-- Table `mydb`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contacto` (
  `Persona_pkIdPersona` INT(11) NOT NULL COMMENT 'Este atributo, indica el id de la persona. Se encuentra como llave foranea para aplicar varios datos telefonicos si se considera pertinente.',
  `telefono` INT(11) NOT NULL COMMENT 'Dentro de este atributo se almacena el numero telefonico de la persona. Es un dato obligatorio en primera instancia y es guardado solamente en entero.',
  INDEX `fk_Contacto_Persona1_idx` (`Persona_pkIdPersona` ASC)  COMMENT '',
  CONSTRAINT `fk_Contacto_Persona1`
    FOREIGN KEY (`Persona_pkIdPersona`)
    REFERENCES `mydb`.`persona` (`pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8
COMMENT = 'En la presente tabla se almacena el numero de contacto para la persona existente en el sistema, por ello se usa la llave foranea persona (la identidad) para agregar mas datos si se considera pertinente.';


-- -----------------------------------------------------
-- Table `mydb`.`controlpedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`controlpedidos` (
  `idFactura` INT(11) NOT NULL COMMENT 'Este atributo, representa el identificador del pedido. Este es un dato unico e irrepetible dentro de la tabla y es de caracter obligatorio.',
  `fecha` DATE NULL COMMENT 'Este atributo almacena los datos referentes a la fecha que se solicita el pedido. Este se caracteriza por ser de tipo \\\"fecha\\\" para el manejo de tal formato.',
  `precioCompra` INT(11) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes al precio de compra del producto que se solicite. Este es de tipo entero para permitir solamente datos numericos.',
  `ivaCompra` DECIMAL(8,0) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes al iva del producto de compra. Este es de tipo decimal.',
  `cantidadProductoSolicitado` INT(11) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes a la cantidad del producto requerido. Esta es de tipo entero puesto que solamente permite datos numericos.',
  `nombreProductoSolicitado` VARCHAR(45) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes al nombre del producto solicitado. Esta es de tipo Varchar para permitir datos alfa-numericos.',
  `precioTotal` INT(20) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes al precio de compra general de los productos solicitados. Este es de tipo entero para permitir solamente datos numericos.',
  `ivaTotal` DECIMAL(8) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes al iva de la compra general. Este es de tipo decimal para permitir el manejo de datos decimales.\n',
  `subTotal` INT(20) NULL DEFAULT NULL COMMENT 'En este atributo se almacena los datos referentes al subtotal de la compra general de los productos que se soliciten. Este es de tipo entero para permitir solamente datos numericos.',
  PRIMARY KEY (`idFactura`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'La presente tabla se encuentra identificada bajo un ID de llave primaria para el control de pedidos al proveedor. Esta conformado por fecha del pedido, precio e iva de la compra, nombre del producto y cantidad requerida.';


-- -----------------------------------------------------
-- Table `mydb`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`factura` (
  `pkIdFactura` INT(11) NOT NULL COMMENT 'Este atributo, indica el id de la factura. Se encuentra como llave primaria para la identidad de la factura. Este es de tipo entero y obligatorio.',
  `Cliente_Personas_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Este atributo, indica el id del cliente. Se encuentra como llave foranea para generar varios registros un cliente. Este es de tipo entero y obligatorio.',
  `fechaFactura` DATE NULL COMMENT 'En el campo de este atributo se almacena el dato de la fecha facturada de compra realizada por el cliente. Es de tipo Date y con obligatoriedad.',
  `subTotal` INT(11) NULL DEFAULT NULL COMMENT 'Dentro de este atributo de almacena los datos correspondientes al subtotal de la compra de productos realizada por el cliente. Es de tipo entero y posee obligatoriedad.',
  `ivaFactura` DECIMAL(8) NULL DEFAULT NULL COMMENT 'En este atributo se guarda los datos del iva total de la compra realiza. Éste es tipo decimal y obligatorio.',
  `valorTotal` INT(11) NULL DEFAULT NULL COMMENT 'Dentro de este atributo se guarda los datos del valor total de la compra. Se caracteriza por ser de tipo entero y con obligatoriedad.',
  `cantidadProductoVendido` INT(11) NULL DEFAULT NULL COMMENT 'En este, se guarda la cantidad requerida de un producto en compra. Es de tipo entero y obligatorio.',
  PRIMARY KEY (`pkIdFactura`)  COMMENT '',
  INDEX `fk_Factura_Cliente1_idx` (`Cliente_Personas_pkIdPersona` ASC)  COMMENT '',
  CONSTRAINT `fk_Factura_Cliente1`
    FOREIGN KEY (`Cliente_Personas_pkIdPersona`)
    REFERENCES `mydb`.`cliente` (`Personas_pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COMMENT = 'En la presente tabla se almacena los datos correspondientes a la factura de venta al cliente. Ésta, tiene un id único e irrepetible. sus atributos son IdCliente, Fecha, Subtotal, IVA, valor, cantidad de producto. ';


-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto` (
  `pkIdProducto` INT(11) NOT NULL COMMENT '',
  `Categoria_pkIdCategoria` INT(11) NULL DEFAULT NULL COMMENT '',
  `nombreProducto` VARCHAR(45) NOT NULL COMMENT '',
  `caducidad` DATE NOT NULL COMMENT '',
  `cantidadProducto` INT(11) NOT NULL COMMENT '',
  `PrecioVenta` INT(11) NOT NULL COMMENT '',
  `ivaProducto` DECIMAL(15,0) NOT NULL COMMENT '',
  PRIMARY KEY (`pkIdProducto`)  COMMENT '',
  INDEX `fk_Producto_Categoria1_idx` (`Categoria_pkIdCategoria` ASC)  COMMENT '',
  CONSTRAINT `fk_Producto_Categoria1`
    FOREIGN KEY (`Categoria_pkIdCategoria`)
    REFERENCES `mydb`.`categoria` (`pkIdCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`ordendecompraproducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ordendecompraproducto` (
  `OrdenDeCompra_idFactura` INT(11) NULL DEFAULT NULL COMMENT 'Este atributo es una llave foranea que proviene de la tabla denominada Control dePedidos, es de caracter obligatorio y entero; en él se almacena los datos de id de orden de compra.',
  `Producto_pkIdProducto` INT(11) NULL DEFAULT NULL COMMENT 'Este atributo es una llave foranea que proviene de la tabla denominada Producto, es de caracter obligatorio y de tipo entero; y en él se almacena los datos del idProducto.',
  INDEX `fk_OrdenDeCompra_has_Producto_Producto1_idx` (`Producto_pkIdProducto` ASC)  COMMENT '',
  INDEX `fk_OrdenDeCompra_has_Producto_OrdenDeCompra1_idx` (`OrdenDeCompra_idFactura` ASC)  COMMENT '',
  CONSTRAINT `fk_OrdenDeCompra_has_Producto_OrdenDeCompra1`
    FOREIGN KEY (`OrdenDeCompra_idFactura`)
    REFERENCES `mydb`.`controlpedidos` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenDeCompra_has_Producto_Producto1`
    FOREIGN KEY (`Producto_pkIdProducto`)
    REFERENCES `mydb`.`producto` (`pkIdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'La presente tabla, se compone de los atributos \"IdOrdendeCompra\" y de \"idProducto\", su función realizar pedidos de con base a los productos existentes.';


-- -----------------------------------------------------
-- Table `mydb`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`permiso` (
  `pkIdPermisos` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Este atributo es la llave primaria, es de tipo entero y no permite omision (es obligatorio). En él se almacena los datos que identifican los permisos.',
  `nombrePermiso` VARCHAR(45) NOT NULL COMMENT 'Este atributo es de tipo varchar y cuenta con obligatoriedad; en él se almacena los datos para especificar el nombre del permiso.',
  PRIMARY KEY (`pkIdPermisos`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'En la presente tabla se alojan los datos correspondientes de los permisos que tendran asignados los usuarios. Este tiene un id de caracter llave primaria y el nombre del permiso, para especificar la misma.';


-- -----------------------------------------------------
-- Table `mydb`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rol` (
  `pkIdRol` INT(11) NOT NULL COMMENT '',
  `nombreRol` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`pkIdRol`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`permisosrol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`permisosrol` (
  `Rol_pkIdRol` INT(11) NOT NULL COMMENT 'Este atributo es una llave foranea heredada de la tabla denominada Roles; es de tipo entero y no permite omision (es obligatorio). En él se almacena los datos que identifican los permisos y permite ser repetida.',
  `Permiso_pkIdPermisos` INT(11) NOT NULL COMMENT 'Este atributo es una llave foranea, puesto que proviene de la tabla denominada Permisos;se caracteriza por ser de tipo entero y no permite omision (es obligatorio). En él se almacena los datos que identifican los roles y permite ser repetida.',
  INDEX `fk_PermisosRol_Rol1_idx` (`Rol_pkIdRol` ASC)  COMMENT '',
  INDEX `fk_PermisosRol_Permiso1_idx` (`Permiso_pkIdPermisos` ASC)  COMMENT '',
  CONSTRAINT `fk_permisos`
    FOREIGN KEY (`Permiso_pkIdPermisos`)
    REFERENCES `mydb`.`permiso` (`pkIdPermisos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles`
    FOREIGN KEY (`Rol_pkIdRol`)
    REFERENCES `mydb`.`rol` (`pkIdRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'En la presente tabla se encuentran los atributos que almacenan los datos del id del rol y del id de permisos; ambos atributos son llaves foraneas y son de tipo entero.';


-- -----------------------------------------------------
-- Table `mydb`.`productofactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productofactura` (
  `Factura_pkIdFactura` INT(11) NOT NULL COMMENT '',
  `Producto_pkIdProducto` INT(11) NOT NULL COMMENT '',
  INDEX `fk_Producto_has_Factura_Factura1_idx` (`Factura_pkIdFactura` ASC)  COMMENT '',
  INDEX `fk_Producto_has_Factura_Producto1_idx` (`Producto_pkIdProducto` ASC)  COMMENT '',
  CONSTRAINT `fk_Producto_has_Factura_Factura1`
    FOREIGN KEY (`Factura_pkIdFactura`)
    REFERENCES `mydb`.`factura` (`pkIdFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Factura_Producto1`
    FOREIGN KEY (`Producto_pkIdProducto`)
    REFERENCES `mydb`.`producto` (`pkIdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedor` (
  `Persona_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `tipoProducto` VARCHAR(45) NOT NULL COMMENT '',
  `Direccion` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`Persona_pkIdPersona`)  COMMENT '',
  CONSTRAINT `fk_Proveedor_Persona1`
    FOREIGN KEY (`Persona_pkIdPersona`)
    REFERENCES `mydb`.`persona` (`pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`proveedorproducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedorproducto` (
  `Proveedor_Persona_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `Producto_pkIdProducto` INT(11) NULL DEFAULT NULL COMMENT '',
  INDEX `fk_Proveedor_has_Producto_Producto1_idx` (`Producto_pkIdProducto` ASC)  COMMENT '',
  INDEX `fk_Proveedor_has_Producto_Proveedor1_idx` (`Proveedor_Persona_pkIdPersona` ASC)  COMMENT '',
  CONSTRAINT `fk_Proveedor_has_Producto_Producto1`
    FOREIGN KEY (`Producto_pkIdProducto`)
    REFERENCES `mydb`.`producto` (`pkIdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedor_has_Producto_Proveedor1`
    FOREIGN KEY (`Proveedor_Persona_pkIdPersona`)
    REFERENCES `mydb`.`proveedor` (`Persona_pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trabajador` (
  `Personas_pkIdPersona` INT(11) NOT NULL COMMENT '',
  `fechaContratacion` DATE NOT NULL COMMENT '',
  `Direccion` VARCHAR(45) NOT NULL COMMENT '',
  `Cargo` VARCHAR(45) NOT NULL COMMENT '',
  `EPS` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`Personas_pkIdPersona`)  COMMENT '',
  CONSTRAINT `fk_trabajador_Personas1`
    FOREIGN KEY (`Personas_pkIdPersona`)
    REFERENCES `mydb`.`persona` (`pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `trabajador_Personas_pkIdPersona` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `Rol_pkIdRol` INT(11) NULL DEFAULT NULL COMMENT '',
  `nombreUsuario` VARCHAR(45) NOT NULL COMMENT '',
  `contraseña` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`trabajador_Personas_pkIdPersona`)  COMMENT '',
  INDEX `fk_Usuario_Rol1_idx` (`Rol_pkIdRol` ASC)  COMMENT '',
  CONSTRAINT `fk_Usuario_Rol1`
    FOREIGN KEY (`Rol_pkIdRol`)
    REFERENCES `mydb`.`rol` (`pkIdRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_trabajador1`
    FOREIGN KEY (`trabajador_Personas_pkIdPersona`)
    REFERENCES `mydb`.`trabajador` (`Personas_pkIdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
