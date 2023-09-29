#!/bin/bash



result="hello-aligned_backbone"

/opt/schrodinger2018-4/run trj_align.py desmond_md_hello-out.cms desmond_md_hello_trj desmond_md_$result -s ::1 -asl '( backbone )' -ref-frame 0
