module Semaforo (
  
  output reg rojo,          // Luz roja
  output reg amarillo,       // Luz amarilla
  output reg verde,        // Luz verde
  input wire clk          //reloj
);

  reg [23:0] contador;       // Registro  para el divisor de frecuencia
  reg [3:0] estado;          // Variable de estado
  

  // la velocidad del semáforo
  parameter DIVISOR = 24'd500000; 

  // Máquina de estado
  always @(posedge clk) begin
    if (contador == DIVISOR - 1) begin
      contador <= 0;
      case (estado)
        3'd0: begin // Estado 0: Rojo
          rojo <= 1;
          amarillo <= 0;
          verde <= 0;
          estado <= 3'd1;
        end
        3'd1: begin // Estado 1: Rojo,Amarillo
          rojo <= 1;
          amarillo <= 1;
          verde <= 0;
          estado <= 3'd2;
        end
        3'd2: begin // Estado 2: Verde
          rojo <= 0;
          amarillo <= 0;
          verde <= 1;
          estado <= 3'd3;
        end
			3'd3: begin // Estado 3: Amarillo
          rojo <= 0;
          amarillo <= 1;
          verde <= 0;
          estado <= 3'd0;
		  end 
        default: estado <= 3'd0; // Estado por defecto
      endcase
    end else begin
      contador <= contador + 1;
    end
  end

endmodule