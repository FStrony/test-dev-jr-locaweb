  /*-----------------------------------------------------------------------------------*/
  /* Autor : Fernando Augusto Santos                                                          */
  /* Data Criação : 05/05/2013                                                         */
  /*-----------------------------------------------------------------------------------*/

-------------------------------------------------------------------------------------------------------------------------
-- 2.2 De acordo com o MER criado na questão 2.1, escreva o código para criação das tabelas e indexes (se for o caso). --
-------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CLIENTE
  (
    cd_cliente NUMBER (10) NOT NULL ,
    nome       VARCHAR2 (50) NOT NULL ,
    email      VARCHAR2 (128) NOT NULL ,
    telefone   NUMBER (9) NOT NULL ,
    dtCadastro DATE NOT NULL ,
    documento  NUMBER (14) NOT NULL
  ) ;
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_PK PRIMARY KEY
(
  cd_cliente
)
;
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE__UN UNIQUE
(
  documento
)
;
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE__UNv1 UNIQUE
(
  email
)
;

CREATE TABLE NOTAFISCAL
  (
    cd_nota    NUMBER (10) NOT NULL ,
    dtEmissao  DATE NOT NULL ,
    vlBruto    NUMBER (8,2) NOT NULL ,
    vlImposto  NUMBER (8,2) NOT NULL ,
    cd_cliente NUMBER (10) NOT NULL
  ) ;
CREATE UNIQUE INDEX NOTAFISCAL__IDX ON NOTAFISCAL
  (
    cd_cliente ASC
  )
  ;
  ALTER TABLE NOTAFISCAL ADD CONSTRAINT NOTAFISCAL_PK PRIMARY KEY
  (
    cd_nota
  )
  ;

CREATE TABLE PEDIDO
  (
    cd_cliente    NUMBER (10) NOT NULL ,
    cd_pedido     NUMBER (10) NOT NULL ,
    cd_tipo       NUMBER (1) NOT NULL ,
    valorUnitario NUMBER (8,2) NOT NULL ,
    quantidade    NUMBER (4) NOT NULL
  ) ;
ALTER TABLE PEDIDO ADD CONSTRAINT PEDIDO_PK PRIMARY KEY
(
  cd_pedido, cd_cliente
)
;

CREATE TABLE TIPO_PEDIDO
  (
    cd_tipo   NUMBER (1) NOT NULL ,
    descricao VARCHAR2 (50) NOT NULL
  ) ;
ALTER TABLE TIPO_PEDIDO ADD CONSTRAINT TIPO_PEDIDO_PK PRIMARY KEY
(
  cd_tipo
)
;
ALTER TABLE TIPO_PEDIDO ADD CONSTRAINT TIPO_PEDIDO__UN UNIQUE
(
  descricao
)
;

ALTER TABLE NOTAFISCAL ADD CONSTRAINT NOTAFISCAL_CLIENTE_FK FOREIGN KEY ( cd_cliente ) REFERENCES CLIENTE ( cd_cliente ) ON
DELETE CASCADE ;

ALTER TABLE PEDIDO ADD CONSTRAINT PEDIDO_CLIENTE_FK FOREIGN KEY ( cd_cliente ) REFERENCES CLIENTE ( cd_cliente ) ON
DELETE CASCADE ;

ALTER TABLE PEDIDO ADD CONSTRAINT PEDIDO_TIPO_PEDIDO_FK FOREIGN KEY ( cd_tipo ) REFERENCES TIPO_PEDIDO ( cd_tipo ) ;

------------------------------------------------------
-- Criando sequencias para geração de autonumericos --
------------------------------------------------------

-- SEQUENCE DA TABELA TIPO_PEDIDO
  CREATE SEQUENCE SQ_TIPO_PEDIDO
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 9
  NOCACHE
  NOCYCLE;
  
-- SEQUENCE DA TABELA CLIENTE
  CREATE SEQUENCE SQ_CLIENTE
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 9999999999
  NOCACHE
  NOCYCLE;  
  
-- SEQUENCE DA TABELA NOTAFISCAL
  CREATE SEQUENCE SQ_NOTAFISCAL
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 9999999999
  NOCACHE
  NOCYCLE;  

----------------------------------------------------
--          Criando as TRIGGERS                   --
----------------------------------------------------

--------------------------------------------------
--       ATENÇÃO EXECUTAR UM BLOCO POR VEZ      --
--------------------------------------------------
-- CRIAÇÃO DA TRIGGER TG_CLIENTE, PARA ADIÇÃO DO PRÓXIMO VALOR DA SEQUENCIA (AUTO-NUMÉRICO) 
-- DURANTE A INSERÇÃO DE LINHAS NA TABELA CLIENTE
  CREATE OR REPLACE TRIGGER TG_CLIENTE
    before INSERT ON CLIENTE
    FOR EACH row 
      BEGIN 
         IF inserting THEN 
            IF :NEW.CD_CLIENTE IS NULL THEN
                  SELECT SQ_CLIENTE.nextval INTO :NEW.CD_CLIENTE FROM dual;
             END IF;
         END IF;
      END;
      
-- CRIAÇÃO DA TRIGGER TG_NOTAFISCAL, PARA ADIÇÃO DO PRÓXIMO VALOR DA SEQUENCIA (AUTO-NUMÉRICO) 
-- DURANTE A INSERÇÃO DE LINHAS NA TABELA NOTA FISCAL
  CREATE OR REPLACE TRIGGER TG_NOTAFISCAL
    before INSERT ON NOTAFISCAL
    FOR EACH row 
      BEGIN 
         IF inserting THEN 
             IF :NEW.CD_NOTA IS NULL THEN
                  SELECT SQ_NOTAFISCAL.nextval INTO :NEW.CD_NOTA FROM dual;
             END IF;
         END IF;
      END;
      
-- CRIAÇÃO DA TRIGGER TG_TIPO_PEDIDO, PARA ADIÇÃO DO PRÓXIMO VALOR DA SEQUENCIA (AUTO-NUMÉRICO) 
-- DURANTE A INSERÇÃO DE LINHAS NA TABELA TIPO PEDIDO
  CREATE OR REPLACE TRIGGER TG_TIPO_PEDIDO
    before INSERT ON TIPO_PEDIDO
    FOR EACH row 
      BEGIN 
         IF inserting THEN 
             IF :NEW.CD_TIPO IS NULL THEN
                  SELECT SQ_TIPO_PEDIDO.nextval INTO :NEW.CD_TIPO FROM dual;
             END IF;
         END IF;
      END;
      
-- CRIAÇÃO DA TRIGGER TG_PEDIDO, PARA ADIÇÃO DO PRÓXIMO VALOR (AUTO-NUMÉRICO) 
-- DURANTE A INSERÇÃO DE LINHAS NA TABELA PEDIDO      
  CREATE OR REPLACE TRIGGER TG_PEDIDO
    BEFORE INSERT ON PEDIDO
    FOR EACH ROW 
    DECLARE 
      N NUMBER :=0;
      BEGIN            
        IF inserting THEN 
            SELECT MAX(CD_PEDIDO) INTO N FROM PEDIDO WHERE CD_CLIENTE = :NEW.CD_CLIENTE;
            IF N IS NULL THEN
               N := 0;
            END IF;
            SELECT N+1 INTO :NEW.CD_PEDIDO FROM dual;   
        END IF;
      END; 
      
      
      
----------------------------------------------------
--              POPULANDO BANCO                   --
----------------------------------------------------
INSERT INTO TIPO_PEDIDO(DESCRICAO) VALUES('Hospedagem de Sites');
INSERT INTO TIPO_PEDIDO(DESCRICAO) VALUES('Servidor Cloud');
INSERT INTO TIPO_PEDIDO(DESCRICAO) VALUES('Loja Virtual');
INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, DTCADASTRO, DOCUMENTO ) VALUES('Fernando', 'fernando_aus@hotmail.com', 991810345, TO_DATE('04/01/2011', 'DD/MM/YYYY'), 42415603856);
INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, DTCADASTRO, DOCUMENTO ) VALUES('Bianca', 'bianca@bianca.com', 991810345, TO_DATE('04/01/2011', 'DD/MM/YYYY'), 42415603855);
INSERT INTO PEDIDO(CD_CLIENTE, CD_TIPO,QUANTIDADE, VALORUNITARIO) VALUES(1,3, 10, 13.00);
INSERT INTO PEDIDO(CD_CLIENTE, CD_TIPO,QUANTIDADE, VALORUNITARIO) VALUES(1,1, 2, 20.00);
INSERT INTO NOTAFISCAL(DTEMISSAO, VLBRUTO, VLIMPOSTO,CD_CLIENTE) VALUES(TO_DATE('04/01/2011', 'DD/MM/YYYY'), 130.0,6.5 ,1);

----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.3 De acordo com o MER criado na questão 2.1, escreva o código SQL capaz de consultar todos PEDIDOs ordenados de forma decrescente pela quantidade. --
----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM PEDIDO ORDER BY QUANTIDADE DESC;
--------------------------------------------------------------------------------------------------------------------------------------
--2.4 De acordo com o MER criado na questão 2.1, escreva o código SQL capaz de consultar as NOTA FISCAIS de um determinado cliente. --
--------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM NOTAFISCAL WHERE CD_CLIENTE = 1;
---------------------------------------------------------------------------------------------------------------------------------------------
--2.5 De acordo com o MER criado na questão 2.1, escreva o código SQL capaz de buscar todos clientes que não possuem nenhuma NOTA FISCAL . --
---------------------------------------------------------------------------------------------------------------------------------------------
SELECT CLI.* FROM CLIENTE CLI INNER JOIN NOTAFISCAL NOTA ON CLI.CD_CLIENTE <> NOTA.CD_CLIENTE;