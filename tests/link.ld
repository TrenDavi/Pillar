MEMORY 
{
rom (rx)  : ORIGIN = 0, LENGTH = 64K
ram (rwx) : org = 0xFFFF, l = 64K
}

_start = main;

STACK_SIZE = 0x2000;

SECTIONS
{
    .text :
    {
        *(.text*)
        *(.rodata*)
    } > rom

    .bss (NOLOAD) :
    {
        *(.bss*)
        *(COMMON)
    } > ram

    .data :
    {
        *(.data*);
    } > rom

    .stack (NOLOAD):
    {
        . = ALIGN(8);
        . = . + STACK_SIZE;
        . = ALIGN(8);
    } > ram

    _end = . ;
}
