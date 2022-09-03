MEMORY
{
  ROM : ORIGIN = 0x00000000, LENGTH = 16777215
  RAM : ORIGIN = 0x00FFFFFF, LENGTH = 16777215
}

_start = main;

SECTIONS
{
  .text :
  {
    *(.text .text.*);
  } > ROM
}
