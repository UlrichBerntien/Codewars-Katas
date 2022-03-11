use std::net::Ipv4Addr;

fn int32_to_ip(int: u32) -> String {
    Ipv4Addr::from(int).to_string()
}