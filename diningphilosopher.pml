#define N 6
int fork[N];

inline eat(nr) {
  fork[nr] = -1;
  fork[(nr + 1) % N] = -1;
}

inline repeat(_pid) {
  fork[(_pid + 1) % N] == -1 || fork[_pid] == -1;
  if
  :: fork[(_pid + 1) % N] == -1 -> fork[(_pid + 1) % N] = _pid;
  :: fork[_pid] == -1 -> fork[_pid] = _pid;
  fi
  fork[(_pid + 1) % N] == -1 || fork[_pid] == -1;
  if
  :: fork[(_pid + 1) % N] == -1 -> fork[(_pid + 1) % N] = _pid;
  :: fork[_pid] == -1 -> fork[_pid] = _pid;
  fi
  eat(_pid);
}


active [N] proctype philosopher() {
  int i;
  for (i : 1 .. N) {
    fork[i - 1] = -1;
  }
  do
  :: repeat(_pid);
  od
}
