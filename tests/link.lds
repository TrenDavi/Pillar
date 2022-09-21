MEMORY 
{
rom (rx)  : ORIGIN = 0, LENGTH = 64K
ram (rwx) : org = 0xFA00, l = 64K
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
        . = . + STACK_SIZE;
    } > ram

    _end = . ;
}
