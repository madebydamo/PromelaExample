bool chicken;
bool fox;
bool grain;
bool farmer;
bool success;
bool failure;

inline step() {
  if
  :: chicken == farmer -> chicken = !chicken;
  :: fox == farmer -> fox = !fox;
  :: grain == farmer -> grain = !grain;
  :: skip;
  fi
  farmer = !farmer;
}

inline check() {
  success = chicken && fox && grain && farmer;
  failure = failure || (chicken == fox && chicken != farmer);
  failure = failure || (chicken == grain && chicken != farmer);

}
active proctype start() {
  chicken = false;
  fox = false;
  grain = false;
  farmer = false;
  success = false;
  failure = false;
  do
  /* We fail on success on purpose, so we get an error if a valid execution is found. 
  If no error occours, the problem is not solvable */
  :: success -> assert(false);
  :: failure -> skip;
  :: else ->
    step();
    check();
  od
}

