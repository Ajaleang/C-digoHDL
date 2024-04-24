module Semaphoro(
    input clk,          // Clock input
    input rst_n,        // Reset input (active low)
    output reg red,     // Red light output
    output reg yellow,  // Yellow light output
    output reg green    // Green light output
);

// Parámetros de tiempo
parameter COUNT_MAX_RED = 50000000;   // Tiempo para el estado rojo (50M ciclos a 50MHz)
parameter COUNT_MAX_YELLOW = 25000000; // Tiempo para el estado amarillo (25M ciclos a 50MHz)
parameter COUNT_MAX_GREEN = 50000000;  // Tiempo para el estado verde (50M ciclos a 50MHz)

// Estados
localparam [1:0] S_IDLE = 2'b00;    // Estado idle
localparam [1:0] S_RED = 2'b01;     // Estado rojo
localparam [1:0] S_YELLOW = 2'b10;  // Estado amarillo
localparam [1:0] S_GREEN = 2'b11;   // Estado verde

// Registro de estado
reg [1:0] state_reg;
reg [25:0] count_reg;

// Comportamiento de la máquina de estados
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        state_reg <= S_IDLE;  // Reiniciar el estado a idle
        count_reg <= 0;       // Reiniciar el contador
    end else begin
        case (state_reg)
            S_IDLE: begin
                count_reg <= 0;
                if (count_reg == COUNT_MAX_RED)
                    state_reg <= S_RED;
            end
            S_RED: begin
                if (count_reg == COUNT_MAX_YELLOW)
                    state_reg <= S_YELLOW;
            end
            S_YELLOW: begin
                if (count_reg == COUNT_MAX_GREEN)
                    state_reg <= S_GREEN;
            end
            S_GREEN: begin
                if (count_reg == COUNT_MAX_RED)
                    state_reg <= S_RED;
            end
            default: state_reg <= S_IDLE;
        endcase
    end
end

// Contador para controlar los tiempos de cada estado
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        count_reg <= 0;  // Reiniciar el contador
    end else begin
        count_reg <= count_reg + 1;  // Incrementar el contador en cada ciclo de reloj
    end
end

// Salidas de los semáforos
always @(posedge clk) begin
    case (state_reg)
        S_IDLE: begin
            red <= 1'b0;
            yellow <= 1'b0;
            green <= 1'b0;
        end
        S_RED: begin
            red <= 1'b1;
            yellow <= 1'b0;
            green <= 1'b0;
        end
        S_YELLOW: begin
            red <= 1'b0;
            yellow <= 1'b1;
            green <= 1'b0;
        end
        S_GREEN: begin
            red <= 1'b0;
            yellow <= 1'b0;
            green <= 1'b1;
        end
        default: begin
            red <= 1'b0;
            yellow <= 1'b0;
            green <= 1'b0;
        end
    endcase
end

endmodule
