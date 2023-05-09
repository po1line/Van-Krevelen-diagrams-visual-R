# Van-Krevelen-diagrams-R
## General description
Here is the plot for nice visualisation of Van Krevelen diagrams to visualise massspectrometry data of natural organic matter (NOM) analysis.
Van Krevelen diagrams are used to characterise individual components of complex mixtures, NOM including. In it's classic variant it is a plot of atomic O/C versus atomic H/C from elemental analysis.

In repo you can find two plotting functions for both continous and discrete values, and the function for plotting the density of diagram saturtion by molecules. 


## The data
To test functions and to understand how to apply it to the data, a test dataset is included. 

|    | Column             | Non-Null Count | Dtype  |
|--- | ------             | ---------------| -----  |
| 0  | file_id            | 9146 non-null  | object |
| 1  | mz                 | 9146 non-null  | float64|
| 2  | i_magnitude        | 9146 non-null  | int64  |
| 3  | m                  | 9146 non-null  | float64|
| 4  | m_cal              | 9146 non-null  | float64|
| 5  | ppm                | 9146 non-null  | float64|
| 6  | nm                 | 9146 non-null  | int64  |
| 7  | mf                 | 9146 non-null  | object |
| 8  | dbe                | 9146 non-null  | int64  |
| 9  | c                  | 9146 non-null  | int64  |
| 10 | h                  | 9146 non-null  | int64  |
| 11 | n                  | 9146 non-null  | int64  |
| 12 | o                  | 9146 non-null  | int64  |
| 13 | p                  | 9146 non-null  | int64  |
| 14 | s                  | 9146 non-null  | int64  |
| 15 | oc                 | 9146 non-null  | float64|
| 16 | hc                 | 9146 non-null  | float64|
| 17 | nc                 | 9146 non-null  | float64|
| 18 | sc                 | 9146 non-null  | float64|
| 19 | kmd                | 9146 non-null  | float64|
| 20 | s_n                | 9146 non-null  | float64|
| 21 | dbe_o              | 9146 non-null  | int64  |
| 22 | n_occurrence       | 9146 non-null  | int64  |
| 23 | n_assignments_orig | 9146 non-null  | int64  |
| 24 | bp                 | 9146 non-null  | int64  |
| 25 | rel_int            | 9146 non-null  | float64|
| 26 | sum_int            | 9146 non-null  | int64  |
| 27 | rel_sum_int        | 9146 non-null  | float64|
| 28 | ai                 | 9146 non-null  | float64|
| 29 | ai_category        | 9146 non-null  | object |
| 30 | ai_mod             | 9146 non-null  | float64|
| 31 | ai_mod_category    | 9146 non-null  | object |
| 32 | form               | 9146 non-null  | object |
| 33 | name               | 9146 non-null  | object |

### Main columns
* ``file_id``, ``name`` – refers to the names of samples in test-data
* ``c``, ``h``, ``n``, ``o``, ``p``, ``s`` - amount of atoms in molecule of individual component; ``oc``, ``hc``, ``nc``, ``sc`` – ratios of number of atoms in molecule;
* ``mf`` - molecular formula of molecule
* ``n_occurrence`` – frequency of molecule occurrence
* ``form`` – simple formula of molecule
* ``ai``, ``ai_mod`` – aromaticity indices calculated according to the following equations ([Zherebker et al., 2022](https://pubs.acs.org/action/showCitFormats?doi=10.1021/acs.est.1c04575&ref=pdf)):

${AI} = \frac{1+C-O-S-0.5N-0.5H}{C-O-N-S} $

${AI_{mod}} = \frac{1+C-(СООН)_y-0.5N-0.5H}{C-(СООН)_y-N-S} $

* ``ai_category`` and ``ai_mod_category`` – categorisation of aromaticity indices according to the rules

* \>= 0.5 and < 0.67 – aromatic structures
* \> 0.67 – condensed structures
* < 0.5 – other structures
