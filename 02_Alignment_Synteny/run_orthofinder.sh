#!/bin/bash
# Cluster NBS-LRR proteins to identify core/dispensable immune genomes
orthofinder -f data/proteins/nbs_lrr_peptides/ -t 16 -a 16 -S diamond