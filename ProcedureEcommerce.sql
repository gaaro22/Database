Use ecommerce;

DELIMITER //
CREATE PROCEDURE Product_proc(
    IN action_ INT,
    IN Idproduct_ INT,
    IN _Description_ VARCHAR(255),
    IN ProductValue_ DECIMAL(10, 2)
    -- IN quantidade INT
)
BEGIN
    -- Variável para controle da ação
    DECLARE execute_action VARCHAR(20);

    -- Determinar a ação com base na variável de controle
    CASE action_
        WHEN 1 THEN SET execute_action = 'select';
        WHEN 2 THEN SET execute_action = 'update';
        WHEN 3 THEN SET execute_action = 'delete';
        ELSE SET execute_action = 'invalida';
    END CASE;

    -- Executar ação conforme determinada pela variável de controle
    IF execute_action = 'select' THEN
        SELECT * FROM product WHERE IdProduct = Idproduct_;
    
    ELSEIF execute_action = 'update' THEN
        UPDATE product SET Description_ = _Description_, ProductValue = ProductValue_ WHERE IdProduct = Idproduct_;
		SELECT * FROM product WHERE IdProduct = Idproduct_;
        
    ELSEIF execute_action = 'delete' THEN
        DELETE FROM product WHERE IdProduct = Idproduct_;
        SELECT * FROM product;

    ELSE
        SELECT 'Ação inválida. Por favor, escolha uma ação válida (1 para select, 2 para update, 3 para delete).' AS mensagem;
    END IF;
END//
DELIMITER ;

call Product_proc(2, 3, 'Iphone 13', 12000);