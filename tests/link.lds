MEMORY 
{
rom (rx)  : ORIGIN = 0, LENGTH = 512K
ram (rwx) : org = 0x7D008, l = 512K
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

    .stack (NOLOAD):
    {
        . = . + STACK_SIZE;
    } > ram

    .bss (NOLOAD) :
    {
        *(.bss*)
        *(COMMON)
    } > ram

    .data :
    {
        *(.data*);
    } > rom

    _end = . ;
}
