[org 0x7c00]
[bits 16]


; Where to load the kernel
KERNEL_OFFSET: equ 0x1000


Main:
    mov [BOOT_DRIVE], dl       ; Bios sets the boot drive number in dl, saving for later

    mov bp, 0x9000             ; Set base pointer
    mov sp, bp                 ; Set stack pointer

    call LoadKernel
    call StartKernel

End:
    jmp End


%include "disk.asm"


; No params
; Reads 2 sectors to the KERNEL_OFFSET
[bits 16]
LoadKernel:
    mov bx, KERNEL_OFFSET      ; bx -> drive load destination
    mov dh, 2                  ; dh -> number of sectors to load
    mov dl, [BOOT_DRIVE]       ; dl -> disk to load
    call DiskLoad              ; Function to read disk in disk.asm
    ret


; No params
; Passes control to the kernel
StartKernel:
    call KERNEL_OFFSET         ; Pass control to the kernel
    ret


BOOT_DRIVE: db 0
END_MESSAGE: db "Kernel has returned"

times 510 - ($-$$) db 0        ; 512 byte padding
dw 0xaa55                      ; Bios flag
