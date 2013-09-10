/*
 * Copyright (c) 2009, Code Aurora Forum. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#ifndef AVS_H
#define AVS_H

#define VOLTAGE_MIN  1000 /* mV */
#define VOLTAGE_MAX  1250
#define VOLTAGE_STEP 25

int __init avs_init(int (*set_vdd)(int), u32 freq_cnt, u32 freq_idx);
void __exit avs_exit(void);

int avs_adjust_freq(u32 freq_index, int begin);

/* Routines exported from avs_hw.S */
u32 avs_test_delays(void);
u32 avs_reset_delays(u32 avsdscr);
u32 avs_get_avscsr(void);
u32 avs_get_avsdscr(void);
u32 avs_get_tscsr(void);
void     avs_set_tscsr(u32 to_tscsr);

/*#define AVSDEBUG(x...) pr_info("AVS: " x);*/
#define AVSDEBUG(...)

#endif /* AVS_H */
