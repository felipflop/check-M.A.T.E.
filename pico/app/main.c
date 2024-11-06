#include "pico/stdlib.h"

#define MUX_NUM 4
#define MUX_OUT_LEN 16  
#define MUX_IN_LEN 4  

#define MUX_S0 12
#define MUX_S1 11
#define MUX_S2 10
#define MUX_S3 9

#define MUX_SIG_1 7
#define MUX_SIG_2 1
#define MUX_SIG_3 2
#define MUX_SIG_4 3

const uint8_t mux_select[MUX_IN_LEN] = {MUX_S0, MUX_S1, MUX_S2, MUX_S3};
const uint8_t mux_output[MUX_IN_LEN] = {MUX_SIG_1, MUX_SIG_2, MUX_SIG_3, MUX_SIG_4};

uint8_t reed_state[MUX_NUM][MUX_OUT_LEN] = {0};

void system_init(void);

int main() {
    system_init();

    while (true) {
        for (int y = 0; y < MUX_OUT_LEN; y++) {
            for (int d = 0; d < MUX_IN_LEN; d++) {
                uint8_t bit = (y >> d) & 1;   // extract relevant bit
                gpio_put(mux_select[d], bit); // set bit for select line
            }

            sleep_ms(2000); 

            for (int i = 0; i < MUX_NUM; i++) {
                reed_state[i][y] = gpio_get(mux_output[i]);
            }
        }
    }
    return 0;
}

void system_init(void) {
    /* Initialize multiplexer selection lines */
    gpio_init(MUX_S0);
    gpio_init(MUX_S1);
    gpio_init(MUX_S2);
    gpio_init(MUX_S3);

    /* Initialize multiplexer output lines */
    gpio_init(MUX_SIG_1);
    gpio_init(MUX_SIG_2);
    gpio_init(MUX_SIG_3);
    gpio_init(MUX_SIG_4);

    /* Set selection lines as outputs */
    gpio_set_dir(MUX_S0, GPIO_OUT);
    gpio_set_dir(MUX_S1, GPIO_OUT);
    gpio_set_dir(MUX_S2, GPIO_OUT);
    gpio_set_dir(MUX_S3, GPIO_OUT);

    /* Set signal lines as inputs */
    gpio_set_dir(MUX_SIG_1, GPIO_IN);
    gpio_set_dir(MUX_SIG_2, GPIO_IN);
    gpio_set_dir(MUX_SIG_3, GPIO_IN);
    gpio_set_dir(MUX_SIG_4, GPIO_IN);
}