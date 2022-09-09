#include <pthread.h>

// Executes the function action nTimes in parallel threads.
void execute (void (*action)(), int nTimes);

// Job description.
typedef struct
{
    void (*action)();   // The job to do.
    int nTimes;         // Number of repeations to do.
}
job_type;

// Does the job given as argument.
static void* do_the_job(void* arg)
{
  job_type *const job_data = (job_type*) arg;
  execute( job_data->action, job_data->nTimes );
  return job_data;
}


void execute (void (*action)(), int nTimes)
{
  if( nTimes == 1 )
  {
    // Do the work here.
    action();
    return;
  }
  else if( nTimes > 1 )
  {
    // Get help by another thread
    job_type job_data = { action, nTimes-1 };
    pthread_t helper;
    pthread_create( &helper, NULL, do_the_job, &job_data );
    // Do the work
    action();
    // Wait until the helper does the rest.
    pthread_join( helper, NULL );
  }
}
