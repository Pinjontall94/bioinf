#!/bin/bash

srun -N1 -t 1:00:00 -n 2 --partition production --pty /bin/bash
