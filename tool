# -*- coding: utf-8 -*-

import numpy as np

def normalizer_mean(df_new):
    for i in df_new:
        
        col_data = df_new[i]
        col_min = min(col_data)
        col_mean = col_data.mean()
        col_max = max(col_data)
        normalized_i = (col_data - col_mean)/(col_max - col_min)
        df_new[i] = normalized_i 
    return df_new

def normalizer_minmax(df_new):
    for i in df_new:
        
        col_data = df_new[i]
        col_min = min(col_data)
        #col_mean = col_data.mean()
        col_max = max(col_data)
        normalized_i = (col_data - col_min)/(col_max - col_min)
        df_new[i] = normalized_i 
    return df_new

def mask_generator(index_list, n, include = True):
    if include:
        arr = np.zeros(n)
        arr[index_list] = 1
    else:
        arr = np.ones(n)
        arr[index_list] = 0
    return arr

def weight_multiplier(mask, weight):
    result = mask.copy()
    for i,j in weight.items():
        if i < len(mask):
            mask[i] *= j
    return result
