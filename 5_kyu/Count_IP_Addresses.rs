use std::net::Ipv4Addr;

fn ips_between(start: &str, end: &str) -> u32 {
    // No error handling here! All input must be well formed and ordered.
    let start_ip = start.parse::<Ipv4Addr>().unwrap();
    let end_ip = end.parse::<Ipv4Addr>().unwrap();
    u32::from(end_ip) - u32::from(start_ip)
}
