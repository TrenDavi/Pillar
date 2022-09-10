MEMORY 
{
rom (rx)  : ORIGIN = 0, LENGTH = 65K
ram (rw) : org = 0xFFFF, l = 65K
}

_start = main;

SECTIONS
{
  .text :
  {
    *(.text .text.*);
  } > rom
}
