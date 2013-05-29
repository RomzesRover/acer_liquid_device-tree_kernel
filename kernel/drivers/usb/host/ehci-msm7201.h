/*
 * ZTE Blade support added by Sven Killig <sven@killig.de>
 *
 * Copyright (c) 2010 Andrew de Quincey
 *
 * This program is free software; you can redistribute  it and/or modify it
 * under  the terms of  the GNU General  Public License as published by the
 * Free Software Foundation;  either version 2 of the  License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the  GNU General Public License along
 * with this program; if not, write  to the Free Software Foundation, Inc.,
 * 675 Mass Ave, Cambridge, MA 02139, USA.
 */
#ifndef _EHCI_MSM7201_H
#define _EHCI_MSM7201_H

struct msm7201_usb_priv
{
	struct clk *clk;
	struct clk *pclk;

	int *phy_init_seq;
///	void (*phy_reset)(void);
	int (*phy_reset)(void __iomem *addr);
	void (*phy_shutdown)(void);
};

static inline struct msm7201_usb_priv *hcd_to_msm7201(struct usb_hcd *hcd)
{
	return (struct msm7201_usb_priv *) (((unsigned char*) (hcd->hcd_priv)) + sizeof(struct ehci_hcd));
}

#define MSM_USB_BASE (hcd->regs)


#include <mach/msm_hsusb_hw.h>


#endif				/* _EHCI_MSM7201_H */
