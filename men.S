#define	CONCONTROL			0xf0000000
#define	MEMCONTROL			0xf0000004
#define	MEMCONFIG0			0xf0000008
#define	DIRECTCMD			0xf0000010
#define	PRECHCONFIG			0xf0000014


#define	DMC_PHYCONTROL0	0xf0000018
#define	DMC_PHYCONTROL1	0xf000001c
#define	PWRDNCONFIG		0xf0000028
#define	DMC_TIMINGAREF		0xf0000030
#define	DMC_TIMINGROW		0xf0000034
#define	DMC_TIMINGDATA		0xf0000038
#define	DMC_TIMINGPOWER	0xf000003c
#define	PHYSTATUS0			0xf0000040

.global men_init
men_init:
	@setp 2.1
	ldr r0,=DMC_PHYCONTROL0
	ldr r1, =0x00101000
	str r1,[r0]
	
	@setp 2.2
	ldr r0,=DMC_PHYCONTROL0
	ldr r1, =0x00101002
	str r1,[r0]

	@setp 4
	ldr r0,=DMC_PHYCONTROL0
	ldr r1, =0x00101003
	str r1,[r0]

	@setp 5
	ldr r0,=CONCONTROL
	ldr r1, =0x0fff1350
	str r1,[r0]

	@setp 6
	ldr r0,=MEMCONTROL
	ldr r1, =0x00202400
	str r1,[r0]

	@setp 7
	ldr r0,=MEMCONFIG0
	ldr r1, =0x20f00313
	str r1,[r0]

	@setp 8
	ldr r0,=PRECHCONFIG
	ldr r1, =0xff000000
	str r1,[r0]
	
	// TimingAref   7.8us*133MHz=1038(0x40E), 100MHz=780(0x30C), 20MHz=156(0x9C), 10MHz=78(0x4E) 200MHZ=0x618
	@setp 9.1
	ldr r0,=DMC_TIMINGAREF
	ldr r1, =0x00000618
	str r1,[r0]

	// TimingRow    for @200MHz
	@setp 9.2
	ldr r0,=DMC_TIMINGROW
	ldr r1, =0x2B34438A
	str r1,[r0]

	@setp 9.3
	ldr r0,=DMC_TIMINGDATA
	ldr r1, =0x24240000
	str r1,[r0]

	@setp 9.4
	ldr r0,=DMC_TIMINGPOWER
	ldr r1, =0x0BDC0343
	str r1,[r0]

	@setp 11
wait_lock:
	ldr r0,=PHYSTATUS0
	ldr r1, [r0]
	and r2,r1,#0x4
	cmp r2,#0x4
	bne wait_lock

	// NOP
	@setp 14
	ldr r0,=DIRECTCMD
	ldr r1, =0x07000000
	str r1,[r0]

	//  PALL
	@setp 16
	ldr r1, =0x01000000
	str r1,[r0]

	//	EMRS2
	@setp 17
	ldr r1, =0x00020000
	str r1,[r0]
	
	//	EMRS3
	@setp 18
	ldr r1, =0x00030000
	str r1,[r0]

	//	EMRS
	@setp 19
	ldr r1, =0x00010400
	str r1,[r0]

	//	MRS
	@setp 20
	ldr r1, =0x00000542
	str r1,[r0]

	//	PALL
	@setp 21
	ldr r1, =0x01000000
	str r1,[r0]

	//	two Auto Refresh
	@setp 22.1
	ldr r1, =0x05000000
	str r1,[r0]

	@setp 22.2
	ldr r1, =0x05000000
	str r1,[r0]

	@setp 23
	ldr r1, =0x00000442
	str r1,[r0]


	@setp 25.1
	ldr r1, =0x00010780
	str r1,[r0]

	@setp 25.2
	ldr r1, =0x00010400
	str r1,[r0]

	@setp 26
	ldr r1, =0x07100000
	str r1,[r0]

	ldr r1, =0x01100000
	str r1,[r0]

	ldr r1, =0x00120000
	str r1,[r0]
	
	ldr r1, =0x00130000
	str r1,[r0]

	ldr r1, =0x00110400
	str r1,[r0]

	ldr r1, =0x00100542
	str r1,[r0]

	ldr r1, =0x01100000
	str r1,[r0]

	ldr r1, =0x05100000
	str r1,[r0]

	ldr r1, =0x05100000
	str r1,[r0]

	ldr r1, =0x00100442
	str r1,[r0]

	ldr r1, =0x00110780
	str r1,[r0]

	ldr r1, =0x00110400
	str r1,[r0]
	
	@setp 27
	ldr r0,=CONCONTROL
	ldr r1, =0x0ff02030
	str r1,[r0]

	ldr r0,=PWRDNCONFIG
	ldr r1, =0xffff00ff
	str r1,[r0]
	
	ldr r0,=MEMCONTROL
	ldr r1, =0x00202400
	str r1,[r0]
	
	mov pc,lr

