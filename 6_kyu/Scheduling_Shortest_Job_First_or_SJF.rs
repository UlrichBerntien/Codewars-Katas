fn sjf(jobs: &[usize], index: usize) -> usize {
    let the_job_time = jobs[index];
    jobs.iter()
        .enumerate()
        .filter(|(id, &time)| time < the_job_time || (time == the_job_time && *id <= index))
        .map(|(_, &time)| time)
        .sum()
}
