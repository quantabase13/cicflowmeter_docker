# cicflowmeter_docker

How To Use:

After installing Docker, use `docker build -t cicflowmeter .` to build the image,
then, use `docker run --rm -v $PWD:/cicflowmeter cicflowmeter [-h] (-i INPUT_INTERFACE | -f INPUT_FILE) [-c] [-u URL_MODEL] output` 

### Usage
```sh
usage: cicflowmeter [-h] (-i INPUT_INTERFACE | -f INPUT_FILE) [-c] [-u URL_MODEL] output

positional arguments:
  output                output file name (in flow mode) or directory (in sequence mode)

optional arguments:
  -h, --help            show this help message and exit
  -i INPUT_INTERFACE    capture online data from INPUT_INTERFACE
  -f INPUT_FILE         capture offline data from INPUT_FILE
  -c, --csv, --flow     output flows as csv
```

Convert pcap file to flow csv:

```
cicflowmeter -f example.pcap -c flows.csv
```

Sniff packets real-time from interface to flow csv: (**need root permission**)

```
cicflowmeter -i eth0 -c flows.csv
```

- Reference: https://www.unb.ca/cic/research/applications.html#CICFlowMeter
