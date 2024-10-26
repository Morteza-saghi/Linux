# `tcpdump` Command

`tcpdump` is a powerful command-line packet analyzer tool. It is useful for capturing and analyzing network traffic. Below is a list of useful options for `tcpdump`, along with explanations of the output that you may encounter.

## Basic Usage

```
tcpdump
```

This will capture packets on the default network interface.

---


```
tcpdump -i <interface>
```
Specify the interface (e.g., eth0, wlan0, etc.) on which to capture traffic.


### Useful Options

---

#### 1. Capture traffic from a specific host

```
tcpdump host <hostname or IP>
```

This will capture all packets to and from the specified host.

---


2. Capture only TCP traffic


```
tcpdump tcp
```
Captures only TCP traffic, filtering out other protocols.

---


3. Capture only UDP traffic

```
tcpdump udp
```

Captures only UDP traffic, filtering out other protocols.

---


4. Capture traffic on a specific port

```
tcpdump port <port_number>
```

This filters packets based on a specific port number (e.g., HTTP, SSH).

---

5. Save captured traffic to a file (in pcap format)
```
tcpdump -w <filename>.pcap
```
Writes the captured packets to a file for later analysis with tools like Wireshark.

---

6. Read from a previously saved file

```
tcpdump -r <filename>.pcap
```

Reads and analyzes packets from a previously saved capture file.

---

7. Capture and show DNS queries

```
tcpdump -i <interface> -n udp port 53
```
Captures DNS query traffic on the specified interface.

---

8. Capture only ICMP (ping) traffic
```
tcpdump icmp
```

Filters and captures only ICMP traffic (commonly used for ping requests).


---

9. Capture traffic from a specific subnet

```
tcpdump net <subnet/mask>
```
Filters traffic for a specific subnet, e.g., 192.168.1.0/24.

---

10. Limit capture size (capture first 100 bytes of each packet)

```
tcpdump -s 100
```

Useful when you don’t need the entire packet for analysis, but only the headers.

---


11. Show packet contents in ASCII (useful for text protocols like HTTP)
```
tcpdump -A
```
Displays the packet contents in ASCII format.


---

13. Filter traffic by protocol (e.g., HTTP)

```
tcpdump 'tcp port 80'
```

Filters and captures HTTP traffic only.

---

## Example Outputs

### 1. TCP Packet Output
```
14:22:43.819758 IP 172.30.202.27.34668 > 192.168.1.1.80: Flags [.], ack 2752241884, win 1136, options [nop,nop,TS val 3526064052 ecr 1731802913], length 0
```

#### Explanation of fields:

- 14:22:43.819758: Timestamp of the packet capture.
- IP: The protocol (here it is IPv4).
- 172.30.202.27.34668: Source IP and port number.
- 192.168.1.1.80: Destination IP and port number.
- Flags [.]: TCP flags (e.g., SYN, ACK, PSH, FIN). . means an acknowledgment (ACK).
- ack 2752241884: Acknowledgment number.
- win 1136: Window size.
- options [nop,nop,TS val 3526064052 ecr 1731802913]: TCP options (e.g., timestamps).
- length 0: Length of the packet payload (0 here indicates no data).

---


### 2. ICMP Packet Output (Ping)

```
14:25:10.571937 IP 192.168.1.100 > 8.8.8.8: ICMP echo request, id 52784, seq 1, length 64
```

#### Explanation:

- 192.168.1.100: Source IP.
- 8.8.8.8: Destination IP (Google DNS).
- ICMP echo request: Type of ICMP packet (ping request).
- id 52784, seq 1: ICMP sequence and identifier.
- length 64: Length of the ICMP packet.

---

### 3. UDP Packet Output

```
14:30:20.123456 IP 192.168.1.50.12345 > 192.168.1.1.53: UDP, length 43
```

#### Explanation:
- 192.168.1.50.12345: Source IP and port number.
- 192.168.1.1.53: Destination IP and port number (UDP port 53 for DNS).
- UDP: Protocol.
- length 43: Length of the UDP payload.

---


### 4. DNS Query Output

```
14:33:02.123456 IP 192.168.1.10.50234 > 8.8.8.8.53: 12345+ A? example.com. (29)
```

#### Explanation:

- 192.168.1.10.50234: Source IP and port.
- 8.8.8.8.53: Destination IP (Google DNS) and port (DNS port 53).
- 12345+: DNS query ID.
- A? example.com.: DNS query type (A record query for example.com).
-(29): Size of the query.

---


### 5. HTTP Request Output (TCP)
14:40:10.123456 IP 192.168.1.100.50512 > 93.184.216.34.80: Flags [P.], seq 123456789, ack 987654321, win 65535, length 334: HTTP: GET /index.html HTTP/1.1

#### Explanation:

- 192.168.1.100.50512: Source IP and port.
- 93.184.216.34.80: Destination IP and port (HTTP on port 80).
- Flags [P.]: PSH flag indicates the push of data.
- seq 123456789: Sequence number of the packet.
- ack 987654321: Acknowledgment number.
- win 65535: Window size.
- length 334: Length of the payload (HTTP request in this case).
- HTTP: GET /index.html HTTP/1.1: HTTP request line captured.

---

### Combining Filters
You can combine multiple filters for more refined packet captures. For example, to capture only TCP traffic on port 80 (HTTP) and from a specific IP:

```
tcpdump tcp port 80 and host 192.168.1.100
```

---

### Best Practices
- Always use filtering to reduce the amount of captured data.
- Save long capture sessions to files (-w option) to avoid overwhelming the terminal output.
- Use short snapshot lengths (-s) when only header information is required.
Review and analyze saved captures with Wireshark for a graphical interface and advanced filtering.


### 1.TCP Flags


| **Flag**               | **Possible Outcomes**                                             | **Meaning**                                                                                                    |
|------------------------|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| **SYN (Flags [S])**     | Initiates a new TCP connection                                    | Starts the 3-way handshake to establish a connection.                                                          |
| **SYN-ACK (Flags [S.])**| Acknowledges a SYN request                                        | Server acknowledges the connection request.                                                                    |
| **ACK (Flags [.])**     | Acknowledges receipt of a packet (e.g., SYN-ACK)                  | Confirms receipt of data or connection request.                                                                |
| **FIN (Flags [F])**     | Requests connection termination                                   | Initiates the termination of the connection.                                                                   |
| **FIN-ACK (Flags [F.])**| Acknowledges a FIN request                                        | Confirms the receipt of a request to close the connection.                                                     |
| **RST (Flags [R])**     | Abruptly resets the connection                                    | Indicates an error or forceful termination of the connection.                                                  |
| **PSH (Flags [P])**     | Pushes data immediately                                           | Sends data immediately without waiting for more data.                                                          |
| **URG (Flags [U])**     | Urgent data being transmitted                                     | Urgent data is being sent (not commonly seen).                                                                 |
| **Multiple Flags**      | SYN + ACK, FIN + ACK                                              | Combination of flags: SYN + ACK acknowledges a connection request, FIN + ACK closes the connection.             |


### 2. Acknowledgment Number

| **Acknowledgment Type**            | **Possible Outcomes**                                             | **Meaning**                                                                                                    |
|------------------------------------|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| **Initial ACK (ack 0)**            | Acknowledgment number is 0                                        | Indicates no data has been received yet (common in the SYN packet).                                            |
| **Acknowledging Data (ack X)**     | Positive acknowledgment number (e.g., ack 1366444155)             | Confirms receipt of all data up to the sequence number 1366444155.                                             |
| **During a FIN Packet (ack X)**    | Acknowledges the final data                                       | Confirms all data received before closing the connection.                                                      |



### 3. Window Size

| **Window Size**                    | **Possible Outcomes**                                             | **Meaning**                                                                                                    |
|------------------------------------|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| **Small Window Size (win 0-1024)** | Small window size (e.g., win 0)                                   | Indicates the sender is low on resources or busy, cannot accept more data.                                      |
| **Normal Window Size (win 1024-65535)** | Medium window size                                             | Indicates normal capacity for data transmission.                                                               |
| **Large Window Size (win > 65535)** | Large window size (e.g., win 524288)                              | Seen when window scaling is used to handle larger amounts of data.                                             |
| **Window Size of 0 (win 0)**       | No data can be accepted                                           | The sender is temporarily unable to accept data (due to flow control or resource issues).                      |



### 4. TCP Options

| **TCP Option**                     | **Possible Outcomes**                                             | **Meaning**                                                                                                    |
|------------------------------------|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| **nop (No-Operation)**             | Padding (e.g., [nop,nop])                                         | Used to align other TCP options.                                                                               |
| **Timestamp Option (TS val ecr)**  | Round-trip time measurement (e.g., TS val 412872057 ecr 1626652347)| Measures round-trip time and prevents sequence number wrapping issues.                                         |
| **MSS (Maximum Segment Size)**     | Maximum segment size (e.g., mss 1460)                             | Specifies the largest segment the receiver can accept.                                                         |
| **SACK (Selective Acknowledgment)**| SACK support (e.g., sackOK)                                       | Acknowledges selective blocks of received data in case of packet loss.                                         |
| **Window Scaling (wscale)**        | Window scaling factor (e.g., wscale 7)                            | Increases the window size to allow more data transmission.                                                     |

### 5. Packet Length


| **Packet Length**                  | **Possible Outcomes**                                             | **Meaning**                                                                                                    |
|------------------------------------|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| **Length 0**                       | No data being transmitted                                         | Typically seen in control packets like SYN, ACK, or FIN packets.                                               |
| **Normal Data Transmission**       | Positive length (e.g., length 1448)                               | Represents the size of the data payload being transmitted.                                                     |
| **MSS-Limited Length**             | Limited by MSS (e.g., length 1460)                                | The packet size is constrained by the Maximum Segment Size.                                                    |






