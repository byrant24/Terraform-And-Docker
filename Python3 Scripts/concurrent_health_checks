import requests
import time
from multiprocessing.dummy import Pool as ThreadPool

urls = [
    'http://www.python.org',
    'http://www.python.org/about/',
    'http://www.onlamp.com/pub/a/python/2003/04/17/metaclasses.html',
    'http://www.python.org/doc/',
    'http://www.python.org/download/',
    'http://www.python.org/getit/',
    'http://www.python.org/community/',
    'https://wiki.python.org/moin/',
    'http://www.python.org',
    'http://www.python.org/about/',
    'http://www.onlamp.com/pub/a/python/2003/04/17/metaclasses.html',
    'http://www.python.org/doc/',
    'http://www.python.org/download/',
    'http://www.python.org/getit/',
    'http://www.python.org',
    'http://www.python.org/about/',
    'http://www.onlamp.com/pub/a/python/2003/04/17/metaclasses.html',
    'http://www.python.org',
]


def response_time(url):
    start_time = time.time()
    try:
        r = requests.get(url, timeout=timeout)
        print("Status Code of {} - {} , RespTime - {}".format(url, r.status_code, time.time() - start_time))
        print("-------------------------")
    except requests.ConnectionError:
        print("failed to connect")


# run cycles on number of processes.
def iteration():
    i = 0
    cycle = 0
    while i < len(urls):
        cycle += 1
        concurrent_health_check(urls[i:i + num_of_processes], cycle)
        i += num_of_processes
        if i + num_of_processes > len(urls):
            cycle += 1
            concurrent_health_check(urls[i:], cycle)
            break


def concurrent_health_check(url, cycle):
    # make the Pool of workers
    pool = ThreadPool(num_of_processes)
    start_time = time.time()
    # open the urls in their own threads
    pool.map(response_time, url)

    # close the pool and wait for the work to finish
    pool.close()
    pool.join()

    print("Start Time cycle {} - {}".format(cycle, start_time))
    print("End Time cycle {} - {}".format(cycle, time.time()))
    print("\n")
    print("================================================================")
    print("Time taken by cycle {} - {}".format(cycle, time.time() - start_time))
    print("================================================================")
    print("\n")


if __name__ == "__main__":
    num_of_processes = 4
    timeout = 10
    iteration()
