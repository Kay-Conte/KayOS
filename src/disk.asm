
; al -> Number of sectors
; cl -> Sector start
; ch -> Cylinder number
; dh -> Head number

; bx -
DiskLoad:
    pusha
_DiskLoadMain:
    push al                    ; Push number of sectors as it will be overwritten by interrupt

    mov ah, 0x02               ; Bios read mode flag
    
    int 0x13
    jc _DiskError

    pop dx                     ; Retrieve intended number of sectors read
    cmp al, dh                 ; Bios int sets al to number of sectors read, compare with intended

    jne _SectorsError           ; If not equal jump to SectorsError
_DiskLoadEnd:
    popa
    ret


_DiskError:
    jmp _DiskError    


_SectorsError:
    jmp _SectorsError
