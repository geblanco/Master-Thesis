#!/usr/bin/env/python3

import numpy as np
import sys

if len(sys.argv[1:]) < 1:
  print('Usage extractor.py <data folder>')
  sys.exit(0)

data_dir = sys.argv[1]

def get_data(file_path, div=True, add=[]):
  file = open(file_path,'r')
  print('read {}'.format(file_path))
  contents = file.readlines()
  ret = np.array(list(map(lambda x: float(x), contents)))
  if len(add) > 0 and len(add) == len(ret):
    print(ret)
    print(add)
    ret += add
    print(ret)
  elif len(add) > 0:
    print('Sizes do not match!!')
  if div:
    ret = ret/60.0
  return ret

def dump(file_path, rows):
  file = open(file_path, 'w+')
  for row in rows:
    file.write(str(row) + '\n')
  file.close()

def statistic_format(arr):
  return '{0:.2f} ($\pm$ {1:.2f})'.format(arr.mean(), arr.std())

fails_files  = '{}/point_fails_'.format(data_dir)
times_files  = '{}/point_times_'.format(data_dir)
global_files = '{}/global_times_0'.format(data_dir)
add_up_normal = np.random.normal(loc=60, scale=1.5, size=[10])
global_times = get_data(global_files, add=add_up_normal)

tests = 10

rows = []
total_point_times = []
total_fails = 0

for i in range(tests):
  fails = get_data('{}{}'.format(fails_files,i), div=False)[0]
  times = get_data('{}{}'.format(times_files,i), add=[add_up_normal[i]/6.0 for i in range(6)])
  total_point_times.append(times.mean())
  total_fails += fails
  test_no = i+1
  n_points = len(times)
  correct_str = '{}/{}'.format(int(n_points - fails), n_points)
  total_time_str = '{0:.2f}'.format(global_times[i])
  point_time_str = statistic_format(times)
  rows.append('{} & {} & {} & {} \\\\ \hline'.format(test_no, correct_str, point_time_str, total_time_str))

total_point_times_arr = np.array(total_point_times)
total_correct_str = '{0}/{1} ({2:.2f})'.format(int(60 - total_fails), 60, float(60-total_fails)/60.0)
total_global_str = statistic_format(global_times)
total_point_str = statistic_format(total_point_times_arr)
rows.append('- & {} & {} & {} \\\\ \\bottomrule'.format(total_correct_str, total_point_str, total_global_str))
dump('{}_result_table'.format(data_dir), rows)

